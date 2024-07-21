import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            savePokemonIdentifiers: { try dataStore.savePokemonIdentifiers($0) },
            fetchPokemonIdentifiers: { try dataStore.fetchPokemonIdentifiers() },
            savePokemon: { try dataStore.savePokemon($0) },
            fetchPokemon: { try dataStore.fetchPokemon($0) }
        )
    }()
}
