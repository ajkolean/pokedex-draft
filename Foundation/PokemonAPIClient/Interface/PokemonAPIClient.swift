// Foundation/PokemonAPIClient/Sources/PokemonAPIClientInterface/PokemonAPIClient.swift
import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct PokemonAPIClient: PokemonFetching {
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [Models.PokemonIdentifier]
    public var fetchPokemonDetails: @Sendable (Models.PokemonName) async throws -> Models.PokemonDetails
    public var fetchPokemonSpecies: @Sendable (URL) async throws -> Models.PokemonSpecies
    public var fetchPokemon: @Sendable (Models.PokemonName) async throws -> Models.Pokemon?
    public var fetchPokemonTypeIdentifiers: @Sendable () async throws -> [Models.TypeIdentifier]
    public var fetchPokemonTypeDetails: @Sendable (String) async throws -> Models.PokemonTypeDetails?
}

extension PokemonAPIClient: TestDependencyKey {
    public static let testValue = Self()
}

extension DependencyValues {
    public var pokemonAPIClient: PokemonAPIClient {
        get { self[PokemonAPIClient.self] }
        set { self[PokemonAPIClient.self] = newValue }
    }
}
