import Foundation
import PokemonGraphClientInterface
import SwiftData

public final class DataStore {
    private let db: ModelActorDatabase
    private init(container: ModelContainer) {
        db = ModelActorDatabase(modelContainer: container)
    }

    public func savePokemons(_ pokemons: [Pokemon]) async throws {
        for pokemon in pokemons.map(PokemonEntity.init) {
            await db.insert(pokemon)
        }
        try await db.debounceSave()
    }

    public func fetchPokemonList() async throws -> [Pokemon] {
        let sortDescriptor = SortDescriptor(\PokemonEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<PokemonEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        let identifiers = models.map(Pokemon.init)
        return identifiers
    }

    public func fetchPokemon(_ name: Pokemon.Name) async throws -> Pokemon? {
        let fetchDescriptor = FetchDescriptor<PokemonEntity>(predicate: #Predicate { $0.name == name })
        let fetchedPokemons = try await db.fetch(fetchDescriptor)
        let pokemon = fetchedPokemons.first
        return pokemon.map(Pokemon.init)
    }

    public func fetchPokemonTypeList() async throws -> [PokemonType] {
        let sortDescriptor = SortDescriptor(\PokemonTypeEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<PokemonTypeEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        return models.map(PokemonType.init)
    }

    public func savePokemonTypes(_ types: [PokemonType]) async throws {
        for type in types.map(PokemonTypeEntity.init) {
            await db.insert(type)
        }
        try await db.debounceSave()
    }

    public func fetchPokemonType(_ type: PokemonTypeEnum) async throws -> PokemonType? {
        let fetchDescriptor = FetchDescriptor<PokemonTypeEntity>(predicate: #Predicate { $0.type == type })
        let fetchedPokemons = try await db.fetch(fetchDescriptor)
        let pokemon = fetchedPokemons.first
        return pokemon.map(PokemonType.init)
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
