import ComposableArchitecture
import Foundation
import PokemonDataStoreClient
import PokemonDataStoreClientInterface
import PokemonGraphClient
import PokemonGraphClientInterface
import PokemonRepoInterface

extension PokemonRepo: DependencyKey {
    public static let liveValue: PokemonRepo = {
        let dataStoreClient = DataStoreClient.liveValue
        let pokemonAPIClient = PokemonAPIClient.liveValue

        return PokemonRepo(
            fetchPokemonList: {
                let cachedPokemons = try await dataStoreClient.fetchPokemonList()
                if !cachedPokemons.isEmpty {
                    return cachedPokemons
                } else {
                    let pokemons = try await pokemonAPIClient.fetchPokemonList()
                    try await dataStoreClient.savePokemons(pokemons)
                    return pokemons
                }
            },
//            fetchPokemon: { name in
//                if let cachedPokemon = try await dataStoreClient.fetchPokemon(name) {
//                    return cachedPokemon
//                } else {
//                    let pokemon = try await pokemonAPIClient.fetchPokemon(name)
//                    if let pokemon {
//                        try await dataStoreClient.savePokemon(pokemon)
//                    }
//                    return pokemon
//                }
//            },
            fetchPokemonTypeList: {
                let cachedTypes = try await dataStoreClient.fetchPokemonTypeList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let types = try await pokemonAPIClient.fetchPokemonTypeList()
                    try await dataStoreClient.savePokemonTypes(types)
                    return types
                }
            }
        )
    }()
}
