import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            savePokemonIdentifiers: { dataStore.savePokemonIdentifiers($0) },
            fetchPokemonIdentifiers: { dataStore.fetchPokemonIdentifiers() },
            savePokemon: { dataStore.savePokemon($0) },
            fetchPokemon: { dataStore.fetchPokemon($0) }
        )
    }()
}
