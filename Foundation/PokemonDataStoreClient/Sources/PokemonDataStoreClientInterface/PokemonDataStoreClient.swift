import ComposableArchitecture
import Foundation
import Models

public struct DataStoreClient: TestDependencyKey {
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var savePokemon: @Sendable (PokemonDetails) async throws -> Void
    public var fetchPokemon: @Sendable (String) async throws -> PokemonDetails?

    public init(
        savePokemonIdentifiers: @escaping @Sendable ([PokemonIdentifier]) async throws -> Void,
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        savePokemon: @escaping @Sendable (PokemonDetails) async throws -> Void,
        fetchPokemon: @escaping @Sendable (String) async throws -> PokemonDetails?
    ) {
        self.savePokemonIdentifiers = savePokemonIdentifiers
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.savePokemon = savePokemon
        self.fetchPokemon = fetchPokemon
    }

    public static let testValue: DataStoreClient = {
        let pokemons = ActorIsolation<[String: PokemonDetails]>([:])
        let pokemonShorts = ActorIsolation<[PokemonIdentifier]>(PokemonIdentifier.mockData)

        return DataStoreClient(
            savePokemonIdentifiers: { newPokemonShorts in
                await pokemonShorts.set(newPokemonShorts)
            },
            fetchPokemonIdentifiers: {
                return await pokemonShorts.value
            },
            savePokemon: { pokemon in
                await pokemons.update { $0[pokemon.name] = pokemon }
            },
            fetchPokemon: { id in
                return await pokemons.value[id]
            }
        )
    }()

    public static let previewValue: DataStoreClient = {
        let pokemons = ActorIsolation<[String: PokemonDetails]>([:])
        let pokemonShorts = ActorIsolation<[PokemonIdentifier]>(PokemonIdentifier.mockData)

        return DataStoreClient(
            savePokemonIdentifiers: { newPokemonShorts in
                await pokemonShorts.set(newPokemonShorts)
            },
            fetchPokemonIdentifiers: {
                return await pokemonShorts.value
            },
            savePokemon: { pokemon in
                await pokemons.update { $0[pokemon.name] = pokemon }
            },
            fetchPokemon: { id in
                return await pokemons.value[id]
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
