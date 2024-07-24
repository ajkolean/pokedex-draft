import ComposableArchitecture
import Foundation
import Models
import PokemonAPIClient
import PokemonAPIClientInterface
import PokemonDataStoreClient
import PokemonDataStoreClientInterface
import PokemonRepoInterface

extension PokemonRepo: DependencyKey {
    public static let liveValue: PokemonRepo = {
        let dataStoreClient = DataStoreClient.liveValue
        let pokemonAPIClient = PokemonAPIClient.liveValue

        return PokemonRepo(
            savePokemonIdentifiers: { shorts in
                try await dataStoreClient.savePokemonIdentifiers(shorts)
            },
            fetchPokemonIdentifiers: {
                let cachedPokemons = try await dataStoreClient.fetchPokemonIdentifiers()
                if !cachedPokemons.isEmpty {
                    return cachedPokemons
                } else {
                    let pokemons = try await pokemonAPIClient.fetchPokemonIdentifiers()
                    try await dataStoreClient.savePokemonIdentifiers(pokemons)
                    return pokemons
                }
            },
            savePokemon: { pokemon in
                try await dataStoreClient.savePokemon(pokemon)
            },
            fetchPokemon: { name in
                if let cachedPokemon = try await dataStoreClient.fetchPokemon(name) {
                    return cachedPokemon
                } else {
                    let pokemon = try await pokemonAPIClient.fetchPokemon(name)
                    print("No cache for pokemon: \(pokemon.details.name)")
                    try await dataStoreClient.savePokemon(pokemon)
                    return pokemon
                }
            },
            fetchTypeIdentifiers: {
                let cachedTypes = try await dataStoreClient.fetchTypeIdentifiers()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let types = try await pokemonAPIClient.fetchTypeIdentifiers()
                    try await dataStoreClient.saveTypeIdentifiers(types)
                    return types
                }
            },
            saveTypeIdentifiers: { types in
                try await dataStoreClient.saveTypeIdentifiers(types)
            }
        )
    }()
}
