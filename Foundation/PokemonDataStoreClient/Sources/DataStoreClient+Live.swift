import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            fetchPokemonList: { try await dataStore.fetchPokemonList() }, 
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
            saveLocationAreas: { try await dataStore.saveLocationAreas($0) }
        )
    }()
}
