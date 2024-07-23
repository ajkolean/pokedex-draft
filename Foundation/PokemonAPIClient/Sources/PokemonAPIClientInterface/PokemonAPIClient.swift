// Foundation/PokemonAPIClient/Sources/PokemonAPIClientInterface/PokemonAPIClient.swift
import ComposableArchitecture
import Foundation
import Models

public struct PokemonAPIClient: Sendable {
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var fetchPokemonDetails: @Sendable (PokemonName) async throws -> PokemonDetails
    public var fetchPokemonSpecies: @Sendable (URL) async throws -> PokemonSpecies
    public var fetchPokemon: @Sendable (PokemonName) async throws -> Pokemon

    public init(
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        fetchPokemonDetails: @escaping @Sendable (PokemonName) async throws -> PokemonDetails,
        fetchPokemonSpecies: @escaping @Sendable (URL) async throws -> PokemonSpecies,
        fetchPokemon: @escaping @Sendable (PokemonName) async throws -> Pokemon
    ) {
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.fetchPokemonDetails = fetchPokemonDetails
        self.fetchPokemonSpecies = fetchPokemonSpecies
        self.fetchPokemon = fetchPokemon
    }
}

extension PokemonAPIClient: TestDependencyKey {
    public static let testValue: PokemonAPIClient = .init(
        fetchPokemonIdentifiers: { PokemonIdentifier.mockData },
        fetchPokemonDetails: { _ in fatalError() },
        fetchPokemonSpecies: { _ in fatalError() },
        fetchPokemon: { _ in fatalError() }
    )

    public static let previewValue: PokemonAPIClient = .init(
        fetchPokemonIdentifiers: { PokemonIdentifier.mockData },
        fetchPokemonDetails: { _ in fatalError() },
        fetchPokemonSpecies: { _ in fatalError() },
        fetchPokemon: { _ in fatalError() }
    )
}

extension DependencyValues {
    public var pokemonAPIClient: PokemonAPIClient {
        get { self[PokemonAPIClient.self] }
        set { self[PokemonAPIClient.self] = newValue }
    }
}
