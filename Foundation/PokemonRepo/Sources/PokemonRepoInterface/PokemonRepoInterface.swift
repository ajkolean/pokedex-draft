import ComposableArchitecture
import Foundation
import Models
import PokemonAPIClientInterface
import PokemonDataStoreClientInterface

@DependencyClient
public struct PokemonRepo: TestDependencyKey {
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var savePokemon: @Sendable (Pokemon) async throws -> Void
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon?
    public var fetchTypeIdentifiers: @Sendable () async throws -> [TypeIdentifier]
    public var saveTypeIdentifiers: @Sendable ([TypeIdentifier]) async throws -> Void
    public var fetchPokemonTypeDetails: @Sendable (String) async throws -> PokemonTypeDetails?

    public static let testValue = Self()
}

extension DependencyValues {
    public var pokemonRepo: PokemonRepo {
        get { self[PokemonRepo.self] }
        set { self[PokemonRepo.self] = newValue }
    }
}
