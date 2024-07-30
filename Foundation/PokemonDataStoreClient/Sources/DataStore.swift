import Foundation

import Models
import SwiftData

public actor DataStore {
    private let db: ModelActorDatabase
    private init(container: ModelContainer) {
        db = ModelActorDatabase(modelContainer: container)
    }

    // MARK: - Pokemon

    public func savePokemonSummaries(_ pokemons: [PokemonSummary]) async throws {
        for pokemon in pokemons.map(PokemonSummaryEntity.init) {
            await db.insert(pokemon)
        }
        try await db.debounceSave()
    }

    public func savePokemons(_ pokemons: [Pokemon]) async throws {
        for pokemon in pokemons.map(PokemonEntity.init) {
            await db.insert(pokemon)
        }
        try await db.debounceSave()
    }

    public func fetchPokemonSummaryList() async throws -> [PokemonSummary] {
        let sortDescriptor = SortDescriptor(\PokemonSummaryEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<PokemonSummaryEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        let identifiers = models.map(PokemonSummary.init)
        return identifiers
    }

    public func fetchPokemon(name: Pokemon.Name) async throws -> Pokemon? {
        let fetchDescriptor = FetchDescriptor<PokemonEntity>(predicate: #Predicate { $0.name == name.rawValue })
        guard let model = try await db.fetchOne(fetchDescriptor) else { return nil }
        try await db.insertAndSave(model)
        return Pokemon(model)
    }

    // MARK: - Type

    public func fetchPokemonTypeList() async throws -> [PokemonType] {
        let sortDescriptor = SortDescriptor(\PokemonTypeEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<PokemonTypeEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        return models.map(PokemonType.init)
    }

    public func savePokemonTypes(_ types: [PokemonType]) async throws {
        for type in types.map(PokemonTypeEntity.init) {
            await db.insert(type)
        }
        try await db.debounceSave()
    }

    public func fetchPokemonType(_ type: PokemonTypeEnum) async throws -> PokemonType? {
        let fetchDescriptor = FetchDescriptor<PokemonTypeEntity>(predicate: #Predicate { $0.type == type })
        let fetchedPokemons = try await db.fetch(fetchDescriptor)
        let pokemon = fetchedPokemons.first
        return pokemon.map(PokemonType.init)
    }

    // MARK: - Item

    public func fetchItemCategoryList() async throws -> [ItemCategory] {
        let sortDescriptor = SortDescriptor(\ItemCategoryEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<ItemCategoryEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        return models.map(ItemCategory.init)
    }

    public func saveItemCategories(_ types: [ItemCategory]) async throws {
        for type in types.map(ItemCategoryEntity.init) {
            await db.insert(type)
        }
        try await db.debounceSave()
    }

    // MARK: - Location

    public func fetchRegionList() async throws -> [Region] {
        let sortDescriptor = SortDescriptor(\RegionEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<RegionEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        return models.map(Region.init)
    }

    public func saveRegions(_ types: [Region]) async throws {
        for type in types.map(RegionEntity.init) {
            await db.insert(type)
        }
        try await db.debounceSave()
    }

    public func fetchLocationsList(regionID: Region.ID) async throws -> [Location] {
        let sortDescriptor = SortDescriptor(\LocationEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<LocationEntity>(
            predicate: #Predicate { $0.id == regionID.rawValue },
            sortBy: [sortDescriptor]
        )
        let models = try await db.fetch(fetchDescriptor)
        return models.map(Location.init)
    }

    public func saveLocations(_ types: [Location]) async throws {
        for type in types.map(LocationEntity.init) {
            await db.insert(type)
        }
        try await db.debounceSave()
    }

    public func fetchLocationArea(id: LocationArea.ID) async throws -> LocationArea? {
        let fetchDescriptor = FetchDescriptor<LocationAreaEntity>(predicate: #Predicate { $0.id == id.rawValue })
        guard let model = try await db.fetchOne(fetchDescriptor) else { return nil }
        try await db.insertAndSave(model)
        return LocationArea(model)
    }

    public func saveLocationAreas(_ types: [LocationArea]) async throws {
        for type in types.map(LocationAreaEntity.init) {
            await db.insert(type)
        }
        try await db.debounceSave()
    }
    
    // MARK: - Move
    public func fetchMoveSummaryList() async throws -> [Move.Summary] {
        let sortDescriptor = SortDescriptor(\MoveSummaryEntity.id, order: .forward)
        let fetchDescriptor = FetchDescriptor<MoveSummaryEntity>(sortBy: [sortDescriptor])
        let models = try await db.fetch(fetchDescriptor)
        let identifiers = models.map(Move.Summary.init)
        return identifiers
    }
    
    public func fetchMove(name: Move.Name) async throws -> Move? {
        let fetchDescriptor = FetchDescriptor<MoveEntity>(predicate: #Predicate { $0.name == name.rawValue })
        guard let model = try await db.fetchOne(fetchDescriptor) else { return nil }
        try await db.insertAndSave(model)
        return Move(model)
    }
    
    public func saveMoveSummaries(_ moves: [Move.Summary]) async throws {
        for move in moves.map(MoveSummaryEntity.init) {
            await db.insert(move)
        }
        try await db.debounceSave()
    }
    
    public func saveMoves(_ moves: [Move]) async throws {
        for move in moves.map(MoveEntity.init) {
            await db.insert(move)
        }
        try await db.debounceSave()
    }
}

extension DataStore {
    public static let shared: DataStore = {
        let container = ModelContainerProvider.shared.container
        return DataStore(container: container)
    }()

    public static let test: DataStore = {
        let container = ModelContainerProvider.test.container
        return DataStore(container: container)
    }()
}
