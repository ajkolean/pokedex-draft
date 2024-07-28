import ComposableArchitecture
import Foundation
import PokemonGraphClientInterface

@DependencyClient
public struct DataStoreClient: Sendable, TestDependencyKey {
    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]

    public static let testValue = Self()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
