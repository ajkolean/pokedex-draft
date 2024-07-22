import ComposableArchitecture
import Foundation
import Models

public struct DataStoreClient: TestDependencyKey {
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var savePokemon: @Sendable (Pokemon) async throws -> Void
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon?

    public init(
        savePokemonIdentifiers: @escaping @Sendable ([PokemonIdentifier]) async throws -> Void,
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        savePokemon: @escaping @Sendable (Pokemon) async throws -> Void,
        fetchPokemon: @escaping @Sendable (PokemonName) async throws -> Pokemon?
    ) {
        self.savePokemonIdentifiers = savePokemonIdentifiers
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.savePokemon = savePokemon
        self.fetchPokemon = fetchPokemon
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
            }
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
            }
        )
    }()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
