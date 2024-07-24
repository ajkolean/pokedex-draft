import Foundation
import Models
import SwiftData
import UIKit

public protocol Database {
    func delete<T>(_ model: T) async where T: PersistentModel
    func insert<T>(_ model: T) async where T: PersistentModel
    func save() async throws
    func fetch<T>(_ descriptor: FetchDescriptor<T>) async throws -> [T] where T: PersistentModel

    func delete<T: PersistentModel>(
        where predicate: Predicate<T>?
    ) async throws
}

public actor ModelActorDatabase: ModelActor {
    public nonisolated let modelExecutor: any ModelExecutor
    public nonisolated let modelContainer: ModelContainer
    private let debounceDelay: any BinaryInteger = 5
    private var saveTask: Task<Void, Error>?
    private var savesCancelled = 0

    public init(modelContainer: ModelContainer) {
        let modelContext = ModelContext(modelContainer)
        modelExecutor = DefaultSerialModelExecutor(modelContext: modelContext)
        self.modelContainer = modelContainer

        Task { @MainActor in
            self.setupNotificationObserver()
        }
    }

    public func delete(_ model: some PersistentModel) async {
        modelContext.delete(model)
    }

    public func insert(_ model: some PersistentModel) async {
        modelContext.insert(model)
    }

    public func delete<T: PersistentModel>(
        where predicate: Predicate<T>?
    ) async throws {
        try modelContext.delete(model: T.self, where: predicate)
    }

    public func save() async throws {
        try modelContext.save()
    }

    public func fetch<T>(_ descriptor: FetchDescriptor<T>) async throws -> [T] where T: PersistentModel {
        return try modelContext.fetch(descriptor)
    }

    public func debounceSave() async throws {
        saveTask?.cancel()
        savesCancelled += 1
        saveTask = Task {
            try await Task.sleep(for: .seconds(debounceDelay))
            print("Saving Pokemon, savesCancelled: \(savesCancelled)")
            try await self.save()
            savesCancelled = 0
        }
    }

    @MainActor
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.willResignActiveNotification,
            object: nil,
            queue: nil
        ) { [weak self] _ in
            guard let self else { return }
            Task {
                do {
                    try await self.handleWillResignActive()
                } catch {
                    print("Failed to setupNotificationObserver: \(error.localizedDescription)")
                }
            }
        }
    }

    private func handleWillResignActive() async throws {
        try await save()
    }
}

public class DataStore {
    private let db: ModelActorDatabase
    private init(container: ModelContainer) {
        db = ModelActorDatabase(modelContainer: container)
    }

    public func savePokemon(_ pokemon: Pokemon) async throws {
        let entity = pokemon.asEntity
        await db.insert(entity)
        try await db.debounceSave()
    }

    public func fetchPokemonIdentifiers() async throws -> [PokemonIdentifier] {
        let sortDescriptor = SortDescriptor(\PokemonIdentifierEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<PokemonIdentifierEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        let identifiers = models.map(\.asModel)
        return identifiers
    }

    public func savePokemonIdentifiers(_ pokemonIdentifiers: [PokemonIdentifier]) async throws {
        for identifier in pokemonIdentifiers {
            let entity = identifier.asEntity
            await db.insert(entity)
        }
        try await db.save()
    }

    public func fetchPokemon(_ name: String) async throws -> Pokemon? {
        let fetchDescriptor = FetchDescriptor<PokemonEntity>(predicate: #Predicate { $0.name == name })
        let fetchedPokemons = try await db.fetch(fetchDescriptor)
        return fetchedPokemons.first?.asModel
    }
}

extension DataStore {
    public static let shared: DataStore = {
        let container = ModelContainerProvider.shared.container
        return DataStore(container: container)
    }()

    public static let test: DataStore = {
        let container = ModelContainerProvider.test.container
        return DataStore(container: container)
    }()
}
