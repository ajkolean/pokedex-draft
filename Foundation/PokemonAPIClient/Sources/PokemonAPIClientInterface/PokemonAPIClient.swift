// Foundation/PokemonAPIClient/Sources/PokemonAPIClientInterface/PokemonAPIClient.swift
import ComposableArchitecture
import Foundation
import Models

public struct PokemonAPIClient {
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var fetchPokemonDetails: @Sendable (String) async throws -> PokemonDetails
    public var fetchPokemonDetailsByURL: @Sendable (String) async throws -> PokemonDetails

    public init(
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        fetchPokemonDetails: @escaping @Sendable (String) async throws -> PokemonDetails,
        fetchPokemonDetailsByURL: @escaping @Sendable (String) async throws -> PokemonDetails
    ) {
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.fetchPokemonDetails = fetchPokemonDetails
        self.fetchPokemonDetailsByURL = fetchPokemonDetailsByURL
    }
}

extension PokemonAPIClient: TestDependencyKey {
    public static let testValue: PokemonAPIClient = .init(
        fetchPokemonIdentifiers: { PokemonIdentifier.mockData },
        fetchPokemonDetails: { _ in fatalError() },
        fetchPokemonDetailsByURL: { _ in fatalError() }
    )

    public static let previewValue: PokemonAPIClient = .init(
        fetchPokemonIdentifiers: { PokemonIdentifier.mockData },
        fetchPokemonDetails: { _ in fatalError() },
        fetchPokemonDetailsByURL: { _ in fatalError() }
    )
}

extension DependencyValues {
    public var pokemonAPIClient: PokemonAPIClient {
        get { self[PokemonAPIClient.self] }
        set { self[PokemonAPIClient.self] = newValue }
    }
}
