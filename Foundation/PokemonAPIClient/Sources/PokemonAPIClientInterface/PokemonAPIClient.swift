// Foundation/PokemonAPIClient/Sources/PokemonAPIClientInterface/PokemonAPIClient.swift
import ComposableArchitecture
import Foundation
import Models

public struct PokemonAPIClient {
    public var fetchPokemonIdentifiers: @Sendable () async throws -> [PokemonIdentifier]
    public var fetchPokemonDetails: @Sendable (Int) async throws -> PokemonDetails

    public init(
        fetchPokemonIdentifiers: @escaping @Sendable () async throws -> [PokemonIdentifier],
        fetchPokemonDetails: @escaping @Sendable (Int) async throws -> PokemonDetails
    ) {
        self.fetchPokemonIdentifiers = fetchPokemonIdentifiers
        self.fetchPokemonDetails = fetchPokemonDetails
    }
}

extension PokemonAPIClient: TestDependencyKey {
    public static let testValue: PokemonAPIClient = .init(
        fetchPokemonIdentifiers: { PokemonIdentifier.mockData },
        fetchPokemonDetails: { _ in fatalError() }
    )

    public static let previewValue: PokemonAPIClient = .init(
        fetchPokemonIdentifiers: { PokemonIdentifier.mockData },
        fetchPokemonDetails: { _ in fatalError() }
    )
}

extension DependencyValues {
    public var pokemonAPIClient: PokemonAPIClient {
        get { self[PokemonAPIClient.self] }
        set { self[PokemonAPIClient.self] = newValue }
    }
}
