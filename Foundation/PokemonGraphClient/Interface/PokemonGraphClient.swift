import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct PokemonAPIClient: Sendable {
    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]
}

extension PokemonAPIClient: TestDependencyKey {
    public static var testValue: Self { Self() }
}

extension DependencyValues {
    public var pokemonAPIClient: PokemonAPIClient {
        get { self[PokemonAPIClient.self] }
        set { self[PokemonAPIClient.self] = newValue }
    }
}
