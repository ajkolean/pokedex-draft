import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            fetchPokemonList: { try await dataStore.fetchPokemonList() },
            fetchPokemonTypeList: { try await dataStore.fetchPokemonTypeList() }
        )
    }()
}
