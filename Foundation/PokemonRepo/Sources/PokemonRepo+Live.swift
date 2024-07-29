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

            fetchPokemonTypeList: {
                let cachedTypes = try await dataStoreClient.fetchPokemonTypeList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let types = try await pokemonAPIClient.fetchPokemonTypeList()
                    try await dataStoreClient.savePokemonTypes(types)
                    return types
                }
            },
            fetchItemCategoryList: {
                let cachedTypes = try await dataStoreClient.fetchItemCategoryList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let types = try await pokemonAPIClient.fetchItemCategoryList()
                    try await dataStoreClient.saveItemCategories(types)
                    return types
                }
            },
            fetchRegionList: {
                let cachedTypes = try await dataStoreClient.fetchRegionList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let results = try await pokemonAPIClient.fetchRegionList()
                    try await dataStoreClient.saveRegions(results)
                    return results
                }
            },
            fetchLocationsList: {
                let cachedTypes = try await dataStoreClient.fetchLocationsList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let results = try await pokemonAPIClient.fetchLocationsList()
                    try await dataStoreClient.saveLocations(results)
                    return results
                }
            },
            fetchLocationArea: { id in
                if let cachedItem = try await dataStoreClient.fetchLocationArea(id: id) {
                    return cachedItem
                } else {
                    let result = try await pokemonAPIClient.fetchLocationArea(id: id)
                    try await dataStoreClient.saveLocationAreas([result])
                    return result
                }
            }
        )
    }()
}
