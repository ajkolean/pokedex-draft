import ComposableArchitecture
import Foundation

import Models

@DependencyClient
public struct PokemonRepo: TestDependencyKey {
    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]

    public static let testValue = Self()
}

extension DependencyValues {
    public var pokemonRepo: PokemonRepo {
        get { self[PokemonRepo.self] }
        set { self[PokemonRepo.self] = newValue }
    }
}
