import Foundation
import Models
import SwiftData
import UIKit

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

    public func fetchTypeIdentifiers() async throws -> [TypeIdentifier] {
        let sortDescriptor = SortDescriptor(\TypeIdentifierEntity.name, order: .forward)
        let fetchDescriptor = FetchDescriptor<TypeIdentifierEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        let identifiers = models.map(\.asModel)
        return identifiers
    }

    public func saveTypeIdentifiers(_ identifiers: [TypeIdentifier]) async throws {
        for identifier in identifiers {
            let entity = TypeIdentifierEntity(identifier)
            await db.insert(entity)
        }
        try await db.save()
    }

    public func fetchPokemonTypeDetails(_ name: String) async throws -> PokemonTypeDetails? {
        let fetchDescriptor = FetchDescriptor<PokemonTypeDetailsEntity>(predicate: #Predicate { $0.name == name })
        let results = try await db.fetch(fetchDescriptor)
        return results.first?.asModel
    }

    public func saveTypeDetails(_ details: PokemonTypeDetails) async throws {
        let entity = PokemonTypeDetailsEntity(details)
        await db.insert(entity)
        try await db.debounceSave()
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
