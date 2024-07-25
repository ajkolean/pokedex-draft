// Foundation/PokemonAPIClient/Sources/PokemonAPIClientInterface/PokemonAPIClient.swift
import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct PokemonAPIClient {
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var fetchPokemonDetails: @Sendable (PokemonName) async throws -> PokemonDetails
    public var fetchPokemonSpecies: @Sendable (URL) async throws -> PokemonSpecies
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon
    public var fetchTypeIdentifiers: @Sendable () async throws -> [TypeIdentifier]
    public var fetchTypeDetails: @Sendable (String) async throws -> PokemonTypeResponse
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
