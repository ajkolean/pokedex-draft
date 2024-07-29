import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct PokemonAPIClient: Sendable {
    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var fetchPokemon: @Sendable (_ name: Pokemon.Name) async throws -> Pokemon
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]
    public var fetchItemCategoryList: @Sendable () async throws -> [ItemCategory]

    // Location
    public var fetchRegionList: @Sendable () async throws -> [Region]
    public var fetchLocationsList: @Sendable (_ regionID: Region.ID) async throws -> [Location]
    public var fetchLocationArea: @Sendable (_ id: LocationArea.ID) async throws -> LocationArea
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
