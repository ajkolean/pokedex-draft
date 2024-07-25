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

public actor ModelActorDatabase: ModelActor, Database {
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
