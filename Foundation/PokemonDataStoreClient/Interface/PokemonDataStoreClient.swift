import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct DataStoreClient: Sendable, TestDependencyKey {
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var savePokemon: @Sendable (Pokemon) async throws -> Void
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon?
    public var fetchTypeIdentifiers: @Sendable () async throws -> [TypeIdentifier]
    public var saveTypeIdentifiers: @Sendable ([TypeIdentifier]) async throws -> Void
    public var fetchPokemonTypeDetails: @Sendable (String) async throws -> PokemonTypeDetails?
    public var savePokemonTypeDetails: @Sendable (PokemonTypeDetails) async throws -> Void


    public static let testValue = Self()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
