// Foundation/PokemonAPIClient/Sources/PokemonAPIClientInterface/PokemonAPIClient.swift
import ComposableArchitecture
import Foundation
import Models

public struct PokemonAPIClient {
    public var fetchPokemonList: @Sendable () async throws -> [PokemonShort]
    public var fetchPokemonDetails: @Sendable (Int) async throws -> Pokemon

    public init(
        fetchPokemonList: @escaping @Sendable () async throws -> [PokemonShort],
        fetchPokemonDetails: @escaping @Sendable (Int) async throws -> Pokemon
    ) {
        self.fetchPokemonList = fetchPokemonList
        self.fetchPokemonDetails = fetchPokemonDetails
    }
}

#if DEBUG
    extension PokemonAPIClient: TestDependencyKey {
        public static let testValue: PokemonAPIClient = .init(
            fetchPokemonList: { PokemonShort.mockData },
            fetchPokemonDetails: { _ in fatalError() }
        )

        public static let previewValue: PokemonAPIClient = .init(
            fetchPokemonList: { PokemonShort.mockData },
            fetchPokemonDetails: { _ in fatalError() }
        )
    }
#endif

extension DependencyValues {
    public var pokemonAPIClient: PokemonAPIClient {
        get { self[PokemonAPIClient.self] }
        set { self[PokemonAPIClient.self] = newValue }
    }
}
