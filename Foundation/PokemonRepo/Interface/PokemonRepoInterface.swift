import ComposableArchitecture
import Foundation

import Models

@DependencyClient
public struct PokemonRepo: TestDependencyKey, Sendable {
    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]

    // MARK: - Item

    public var fetchItemCategoryList: @Sendable () async throws -> [ItemCategory]
    
    // MARK: - Location
    public var fetchRegionList: @Sendable () async throws -> [Region]
    public var fetchLocationsList: @Sendable () async throws -> [Location]
    public var fetchLocationArea: @Sendable (_ id: LocationArea.ID) async throws -> LocationArea

    public static let testValue = Self()
}

extension DependencyValues {
    public var pokemonRepo: PokemonRepo {
        get { self[PokemonRepo.self] }
        set { self[PokemonRepo.self] = newValue }
    }
}
