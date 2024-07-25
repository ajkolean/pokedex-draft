import Foundation
import ComposableArchitecture

public protocol PokemonFetching: Sendable {
    var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier] { get }
    var fetchPokemon: @Sendable (_ name: PokemonName) async throws -> Pokemon? { get }
    var fetchPokemonTypeIdentifiers: @Sendable () async throws -> [TypeIdentifier] { get }
    var fetchPokemonTypeDetails: @Sendable (_ type: String) async throws -> PokemonTypeDetails? { get }
}

// Protocol for saving and fetching data in the datastore, inheriting from PokemonFetching
public protocol PokemonDataService: PokemonFetching {
    var savePokemonIdentifiers: @Sendable (_ pokemonIdentifiers: [PokemonIdentifier]) async throws -> Void { get }
    var savePokemon: @Sendable (Pokemon) async throws -> Void { get }
    var saveTypeIdentifiers: @Sendable (_ typeIdentifiers: [TypeIdentifier]) async throws -> Void { get }
    var savePokemonTypeDetails: @Sendable (_ pokemonTypeDetails: PokemonTypeDetails) async throws -> Void { get }
}
