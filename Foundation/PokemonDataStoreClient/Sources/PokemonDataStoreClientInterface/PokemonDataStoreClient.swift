import ComposableArchitecture
import Foundation
import Models

public struct DataStoreClient: Sendable, TestDependencyKey {
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var savePokemon: @Sendable (Pokemon) async throws -> Void
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon?
    public var fetchTypeIdentifiers: @Sendable () async throws -> [TypeIdentifier]
    public var saveTypeIdentifiers: @Sendable ([TypeIdentifier]) async throws -> Void

    public init(
        savePokemonIdentifiers: @escaping @Sendable ([PokemonIdentifier]) async throws -> Void,
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        savePokemon: @escaping @Sendable (Pokemon) async throws -> Void,
        fetchPokemon: @escaping @Sendable (PokemonName) async throws -> Pokemon?,
        fetchTypeIdentifiers: @escaping @Sendable () async throws -> [TypeIdentifier],
        saveTypeIdentifiers: @escaping @Sendable ([TypeIdentifier]) async throws -> Void
    ) {
        self.savePokemonIdentifiers = savePokemonIdentifiers
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.savePokemon = savePokemon
        self.fetchPokemon = fetchPokemon
        self.fetchTypeIdentifiers = fetchTypeIdentifiers
        self.saveTypeIdentifiers = saveTypeIdentifiers
    }

    public static let testValue: DataStoreClient = {
        let pokemons = ActorIsolation<[PokemonName: Pokemon]>([:])
        let pokemonShorts = ActorIsolation<[PokemonIdentifier]>(PokemonIdentifier.mockData)

        return DataStoreClient(
            savePokemonIdentifiers: { newPokemonShorts in
                await pokemonShorts.set(newPokemonShorts)
            },
            fetchPokemonIdentifiers: {
                return await pokemonShorts.value
            },
            savePokemon: { pokemon in
                await pokemons.update { $0[pokemon.details.name] = pokemon }
            },
            fetchPokemon: { id in
                return await pokemons.value[id]
            },
            fetchTypeIdentifiers: { fatalError() },
            saveTypeIdentifiers: { _ in fatalError() }
        )
    }()

    public static let previewValue: DataStoreClient = {
        let pokemons = ActorIsolation<[PokemonName: Pokemon]>([:])
        let pokemonShorts = ActorIsolation<[PokemonIdentifier]>(PokemonIdentifier.mockData)

        return DataStoreClient(
            savePokemonIdentifiers: { newPokemonShorts in
                await pokemonShorts.set(newPokemonShorts)
            },
            fetchPokemonIdentifiers: {
                return await pokemonShorts.value
            },
            savePokemon: { pokemon in
                await pokemons.update { $0[pokemon.details.name] = pokemon }
            },
            fetchPokemon: { name in
                return await pokemons.value[name]
            },
            fetchTypeIdentifiers: { fatalError() },
            saveTypeIdentifiers: { _ in fatalError() }
        )
    }()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
