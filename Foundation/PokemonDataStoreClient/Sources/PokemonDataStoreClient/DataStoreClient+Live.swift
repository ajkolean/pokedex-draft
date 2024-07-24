import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            savePokemonIdentifiers: { try await dataStore.savePokemonIdentifiers($0) },
            fetchPokemonIdentifiers: { try await dataStore.fetchPokemonIdentifiers() },
            savePokemon: { try await dataStore.savePokemon($0) },
            fetchPokemon: { try await dataStore.fetchPokemon($0) },
            fetchTypeIdentifiers: { try await dataStore.fetchTypeIdentifiers() },
            saveTypeIdentifiers:{ try await dataStore.saveTypeIdentifiers($0) }
        )
    }()
}
