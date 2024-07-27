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
            fetchPokemon: { name in
                if let cachedPokemon = try await dataStoreClient.fetchPokemon(name) {
                    return cachedPokemon
                } else {
                    let pokemon = try await pokemonAPIClient.fetchPokemon(name)
                    if let pokemon {
                        try await dataStoreClient.savePokemon(pokemon)
                    }
                    return pokemon
                }
            },
            fetchPokemonTypeIdentifiers: {
                let cachedTypes = try await dataStoreClient.fetchPokemonTypeIdentifiers()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let types = try await pokemonAPIClient.fetchPokemonTypeIdentifiers()
                    try await dataStoreClient.saveTypeIdentifiers(types)
                    return types
                }
            },
            fetchPokemonTypeDetails: { name in
                if let cachedItem = try await dataStoreClient.fetchPokemonTypeDetails(name) {
                    return cachedItem
                } else {
                    let details = try await pokemonAPIClient.fetchPokemonTypeDetails(name)
                    if let details {
                        try await dataStoreClient.savePokemonTypeDetails(details)
                    }
                    return details
                }
            },
            savePokemonIdentifiers: { pokemon in
                try await dataStoreClient.savePokemonIdentifiers(pokemon)
            },

            savePokemon: { shorts in
                try await dataStoreClient.savePokemon(shorts)
            },
            saveTypeIdentifiers: { types in
                try await dataStoreClient.saveTypeIdentifiers(types)
            },
            savePokemonTypeDetails: { typeDetails in
                try await dataStoreClient.savePokemonTypeDetails(typeDetails)
            }
        )
    }()
}
