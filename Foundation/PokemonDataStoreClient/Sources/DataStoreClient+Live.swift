import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            fetchPokemonList: { try await dataStore.fetchPokemonList() },
            savePokemons: { try await dataStore.savePokemons($0) },
            fetchPokemonTypeList: { try await dataStore.fetchPokemonTypeList() },
            savePokemonTypes: { try await dataStore.savePokemonTypes($0) },
            fetchItemCategoryList: { try await dataStore.fetchItemCategoryList() },
            saveItemCategories: { try await dataStore.saveItemCategories($0) }
        )
    }()
}
