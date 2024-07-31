import ComposableArchitecture
import Foundation

import Models

@DependencyClient
public struct DataStoreClient: Sendable, TestDependencyKey {
    // MARK: - Pokemon

    public var fetchPokemonSummaryList: @Sendable () async throws -> [PokemonSummary]
    public var savePokemonSummaries: @Sendable ([PokemonSummary]) async throws -> Void
    public var fetchPokemon: @Sendable (_ name: Pokemon.Name) async throws -> Pokemon?
    public var savePokemons: @Sendable ([Pokemon]) async throws -> Void

    // MARK: - Type

    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]
    public var savePokemonTypes: @Sendable ([PokemonType]) async throws -> Void

    // MARK: - Type

    public var fetchItemCategoryList: @Sendable () async throws -> [ItemCategory]
    public var saveItemCategories: @Sendable ([ItemCategory]) async throws -> Void

    // Location
    public var fetchRegionList: @Sendable () async throws -> [Region]
    public var saveRegions: @Sendable ([Region]) async throws -> Void
    public var fetchLocationsList: @Sendable (_ regionID: Region.ID) async throws -> [Location]
    public var saveLocations: @Sendable ([Location]) async throws -> Void
    public var fetchLocationArea: @Sendable (_ id: LocationArea.ID) async throws -> LocationArea?
    public var saveLocationAreas: @Sendable ([LocationArea]) async throws -> Void

    // MARK: - Move

    public var fetchMoveSummaryList: @Sendable () async throws -> [Move.Summary]
    public var fetchMove: @Sendable (_ name: Move.Name) async throws -> Move?
    public var saveMoveSummaries: @Sendable (_ moves: [Move.Summary]) async throws -> Void
    public var saveMoves: @Sendable (_ moves: [Move]) async throws -> Void
    
    // MARK: - TCG
    public var fetchTCGSetList: @Sendable () async throws -> [TCG.Set]
    public var saveTCGSets: @Sendable ([TCG.Set]) async throws -> Void
    public var fetchTCGCardList: @Sendable (_ name: TCG.Set.Name) async throws -> [TCG.Card]
    public var fetchTCGCard: @Sendable (_ name: TCG.Card.Name) async throws -> [TCG.Card]
    public var saveTCGCards: @Sendable ([TCG.Card]) async throws -> Void
    

    public static let testValue = Self()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
