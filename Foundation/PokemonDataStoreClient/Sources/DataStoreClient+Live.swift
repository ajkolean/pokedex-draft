import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: @retroactive DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            fetchPokemonSummaryList: { try await dataStore.fetchPokemonSummaryList() },
            savePokemonSummaries: { try await dataStore.savePokemonSummaries($0) },
            fetchPokemon: { try await dataStore.fetchPokemon(name: $0) },
            savePokemons: { try await dataStore.savePokemons($0) },
            fetchPokemonTypeList: { try await dataStore.fetchPokemonTypeList() },
            savePokemonTypes: { try await dataStore.savePokemonTypes($0) },
            fetchItemCategoryList: { try await dataStore.fetchItemCategoryList() },
            saveItemCategories: { try await dataStore.saveItemCategories($0) },
            fetchRegionList: { try await dataStore.fetchRegionList() },
            saveRegions: { try await dataStore.saveRegions($0) },
            fetchLocationsList: { try await dataStore.fetchLocationsList(regionID: $0) },
            saveLocations: { try await dataStore.saveLocations($0) },
            fetchLocationArea: { try await dataStore.fetchLocationArea(id: $0) },
            saveLocationAreas: { try await dataStore.saveLocationAreas($0) },
            fetchMoveSummaryList: { try await dataStore.fetchMoveSummaryList() },
            fetchMove: { try await dataStore.fetchMove(name: $0) },
            saveMoveSummaries: { try await dataStore.saveMoveSummaries($0) },
            saveMoves: { try await dataStore.saveMoves($0) },
            fetchTCGSetList: { try await dataStore.fetchTCGSetList() },
            saveTCGSets: { try await dataStore.saveTCGSets($0) },
            fetchTCGCardsBySetID: { try await dataStore.fetchTCGCardsBySetID($0) },
            fetchTCGCard: { try await dataStore.fetchTCGCard(name: $0) },
            saveTCGCards: { try await dataStore.saveTCGCards($0) }
        )
    }()
}
