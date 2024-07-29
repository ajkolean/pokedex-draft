import ComposableArchitecture
import Foundation

import Models

@DependencyClient
public struct DataStoreClient: Sendable, TestDependencyKey {
    // MARK: - Pokemon

    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
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

    public static let testValue = Self()
}

extension DependencyValues {
    public var dataStoreClient: DataStoreClient {
        get { self[DataStoreClient.self] }
        set { self[DataStoreClient.self] = newValue }
    }
}
