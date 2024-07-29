import ComposableArchitecture
import Foundation

import Models

@DependencyClient
public struct DataStoreClient: Sendable, TestDependencyKey {
    // MARK: - Pokemon

    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var savePokemons: @Sendable ([Pokemon]) async throws -> Void

    // MARK: - Type

    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]
    public var savePokemonTypes: @Sendable ([PokemonType]) async throws -> Void

    public static let testValue = Self()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
