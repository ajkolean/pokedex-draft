import ComposableArchitecture
import Foundation
import Models
import PokemonAPIClientInterface
import PokemonDataStoreClientInterface

@DependencyClient
public struct PokemonRepo: TestDependencyKey, PokemonDataService {
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon?
    public var fetchPokemonTypeIdentifiers: @Sendable () async throws -> [TypeIdentifier]
    public var fetchPokemonTypeDetails: @Sendable (String) async throws -> PokemonTypeDetails?
    public var savePokemonIdentifiers: @Sendable ([PokemonIdentifier]) async throws -> Void
    public var savePokemon: @Sendable (Pokemon) async throws -> Void
    public var saveTypeIdentifiers: @Sendable ([TypeIdentifier]) async throws -> Void
    public var savePokemonTypeDetails: @Sendable (PokemonTypeDetails) async throws -> Void

    public static let testValue = Self()
}

extension DependencyValues {
    public var pokemonRepo: PokemonRepo {
        get { self[PokemonRepo.self] }
        set { self[PokemonRepo.self] = newValue }
    }
}
