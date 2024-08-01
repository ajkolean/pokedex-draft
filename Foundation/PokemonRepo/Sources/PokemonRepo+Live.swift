import ComposableArchitecture
import Foundation
import PokemonDataStoreClient
import PokemonDataStoreClientInterface
import PokemonGraphClient
import PokemonGraphClientInterface
import PokemonRepoInterface
import TCGNetworkClient
import TCGNetworkClientInterface

extension PokemonRepo: DependencyKey {
    public static let liveValue: PokemonRepo = {
        let dataStoreClient = DataStoreClient.liveValue
        let pokemonAPIClient = PokemonAPIClient.liveValue
        let tcgClient = TCGNetworkClient.liveValue

        return PokemonRepo(
            fetchPokemonSummaryList: {
                let cachedPokemons = try await dataStoreClient.fetchPokemonSummaryList()
                if !cachedPokemons.isEmpty {
                    return cachedPokemons
                } else {
                    let pokemons = try await pokemonAPIClient.fetchPokemonSummaryList()
                    try await dataStoreClient.savePokemonSummaries(pokemons)
                    return pokemons
                }
            },
            fetchPokemon: { name in
                if let cachedItem = try await dataStoreClient.fetchPokemon(name: name) {
                    return cachedItem
                } else {
                    let result = try await pokemonAPIClient.fetchPokemon(name: name)
                    try await dataStoreClient.savePokemons([result])
                    return result
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
            fetchLocationsList: { regionID in
                let cachedTypes = try await dataStoreClient.fetchLocationsList(regionID: regionID)
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let results = try await pokemonAPIClient.fetchLocationsList(regionID: regionID)
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
            },
            fetchMoveSummaryList: {
                let cachedTypes = try await dataStoreClient.fetchMoveSummaryList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let results = try await pokemonAPIClient.fetchMoveSummaryList()
                    try await dataStoreClient.saveMoveSummaries(moves: results)
                    return results
                }
            },
            fetchMove: { name in
                if let cachedItem = try await dataStoreClient.fetchMove(name: name) {
                    return cachedItem
                } else {
                    let result = try await pokemonAPIClient.fetchMove(name: name)
                    try await dataStoreClient.saveMoves([result])
                    return result
                }
            },
            fetchAllTCGSets: {
                let cachedTypes = try await dataStoreClient.fetchTCGSetList()
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let results = try await tcgClient.fetchAllTCGSets()
                    try await dataStoreClient.saveTCGSets(results.sets)
                    return results.sets
                }
            },
            fetchTCGCardsBySetID: { id in
                let cachedTypes = try await dataStoreClient.fetchTCGCardsBySetID(id)
                if !cachedTypes.isEmpty {
                    return cachedTypes
                } else {
                    let results = try await tcgClient.fetchTCGCardsBySetID(id)
                    try await dataStoreClient.saveTCGCards(results.cards)
                    return results.cards
                }
            },
            fetchCardsByPokemonName: { name in
                let cachedTypes = try await dataStoreClient.fetchTCGCard(name: name)
                if cachedTypes.count > 1 {
                    return cachedTypes
                } else {
                    let result = try await tcgClient.fetchCardsByPokemonName(pokemonName: name)
                    try await dataStoreClient.saveTCGCards(result.cards)
                    return result.cards
                }
            }
        )
    }()
}
