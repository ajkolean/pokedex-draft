import ComposableArchitecture
import Foundation
import Models
import PokemonDataStoreClientInterface

extension DataStoreClient: DependencyKey {
    public static let liveValue: DataStoreClient = {
        let dataStore = DataStore.shared
        return DataStoreClient(
            fetchPokemonIdentifiers: { try await dataStore.fetchPokemonIdentifiers() },
            fetchPokemon: { try await dataStore.fetchPokemon($0) },
            fetchPokemonTypeIdentifiers: { try await dataStore.fetchPokemonTypeIdentifiers() },
            fetchPokemonTypeDetails: { try await dataStore.fetchPokemonTypeDetails($0) },
            savePokemonIdentifiers: { try await dataStore.savePokemonIdentifiers($0) },
            savePokemon: { try await dataStore.savePokemon($0) },
            saveTypeIdentifiers: { try await dataStore.saveTypeIdentifiers($0) },
            savePokemonTypeDetails: { try await dataStore.savePokemonTypeDetails($0) }
        )
    }()
}
