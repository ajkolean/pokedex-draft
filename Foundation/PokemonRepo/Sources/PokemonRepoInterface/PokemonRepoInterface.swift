import ComposableArchitecture
import Foundation
import Models
import PokemonAPIClientInterface
import PokemonDataStoreClientInterface

public struct PokemonRepo: TestDependencyKey {
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var savePokemon: @Sendable (PokemonDetails) async throws -> Void
    public var fetchPokemon: @Sendable (Int) async throws -> PokemonDetails?

    public init(
        savePokemonIdentifiers: @escaping @Sendable ([PokemonIdentifier]) async throws -> Void,
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        savePokemon: @escaping @Sendable (PokemonDetails) async throws -> Void,
        fetchPokemon: @escaping @Sendable (Int) async throws -> PokemonDetails?
    ) {
        self.savePokemonIdentifiers = savePokemonIdentifiers
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.savePokemon = savePokemon
        self.fetchPokemon = fetchPokemon
    }

    public static let testValue: PokemonRepo = {
        let pokemons = ActorIsolation<[Int: PokemonDetails]>([:])
        let pokemonShorts = ActorIsolation<[PokemonIdentifier]>(PokemonIdentifier.mockData)

        return PokemonRepo(
            savePokemonIdentifiers: { newPokemonShorts in
                await pokemonShorts.set(newPokemonShorts)
            },
            fetchPokemonIdentifiers: {
                return await pokemonShorts.value
            },
            savePokemon: { pokemon in
                await pokemons.update { $0[pokemon.id] = pokemon }
            },
            fetchPokemon: { id in
                return await pokemons.value[id]
            }
        )
    }()

    public static let previewValue: PokemonRepo = {
        let pokemons = ActorIsolation<[Int: PokemonDetails]>([:])
        let pokemonShorts = ActorIsolation<[PokemonIdentifier]>(PokemonIdentifier.mockData)

        return PokemonRepo(
            savePokemonIdentifiers: { newPokemonShorts in
                await pokemonShorts.set(newPokemonShorts)
            },
            fetchPokemonIdentifiers: {
                return await pokemonShorts.value
            },
            savePokemon: { pokemon in
                await pokemons.update { $0[pokemon.id] = pokemon }
            },
            fetchPokemon: { id in
                return await pokemons.value[id]
            }
        )
    }()
}

extension DependencyValues {
    public var pokemonRepo: PokemonRepo {
        get { self[PokemonRepo.self] }
        set { self[PokemonRepo.self] = newValue }
    }
}

