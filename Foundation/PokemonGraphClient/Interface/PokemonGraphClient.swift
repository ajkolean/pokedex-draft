import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct PokemonAPIClient: Sendable {
    public var fetchPokemonSummaryList: @Sendable () async throws -> [PokemonSummary]
    public var fetchPokemon: @Sendable (_ name: Pokemon.Name) async throws -> Pokemon
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]
    public var fetchItemCategoryList: @Sendable () async throws -> [ItemCategory]

    // Location
    public var fetchRegionList: @Sendable () async throws -> [Region]
    public var fetchLocationsList: @Sendable (_ regionID: Region.ID) async throws -> [Location]
    public var fetchLocationArea: @Sendable (_ id: LocationArea.ID) async throws -> LocationArea
    
    // MARK: - Move
    public var fetchMoveSummaryList: @Sendable () async throws -> [Move.Summary]
    public var fetchMove: @Sendable (_ name: Move.Name) async throws -> Move
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
