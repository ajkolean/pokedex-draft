import Apollo
import Foundation
import Models

actor APIService {
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://beta.pokeapi.co/graphql/v1beta")!)

    public init() {}

    public func fetchPokemonSummaryList(limit: Int? = nil, offset: Int? = nil) async throws -> [PokemonSummary] {
        let query = GraphClient.GetPokemonSummaryListQuery(limit: GraphQLNullable(limit), offset: GraphQLNullable(offset))
        let data = try await fetch(query: query)
        return data.pokemons.compactMap { PokemonSummary($0.fragments.pokemonSummaryFragment) }
    }

    public func fetchPokemon(name: Pokemon.Name) async throws -> Pokemon {
        let query = GraphClient.GetPokemonByNameQuery(name: name.rawValue)
        let data = try await fetch(query: query)
        // throw error here
        let fragment = data.pokemon.first!.fragments.pokemonFragment
        return Pokemon(fragment)
    }

    public func fetchPokemoTypenList(limit: Int? = nil, offset: Int? = nil) async throws -> [PokemonType] {
        let query = GraphClient.GetPokemonTypeListQuery(limit: GraphQLNullable(limit), offset: GraphQLNullable(offset))
        let data = try await fetch(query: query)
        return data.types.compactMap { PokemonType($0.fragments.typeFragment) }
    }

    public func fetchItemCategoryList() async throws -> [ItemCategory] {
        let query = GraphClient.GetItemCategoriesQuery()
        let data = try await fetch(query: query)
        return data.categories.compactMap { ItemCategory($0.fragments.itemCategoryFragment) }
    }

    // MARK: - Location

    public func fetchRegionList() async throws -> [Region] {
        let query = GraphClient.GetRegionListQuery()
        let data = try await fetch(query: query)
        return data.regions.compactMap { Region($0.fragments.regionFragment) }
    }

    public func fetchLocationsList(id: Region.ID) async throws -> [Location] {
        let query = GraphClient.GetLocationsListQuery(regionID: GraphQLNullable(id.rawValue))
        let data = try await fetch(query: query)
        return data.areas.compactMap { Location($0.fragments.locationFramgment) }
    }

    public func fetchLocationArea(id: LocationArea.ID) async throws -> LocationArea {
        let query = GraphClient.GetLocationAreaQuery(id: GraphQLNullable<Int>(id.rawValue))
        let data = try await fetch(query: query)
        // throw error here
        let fragment = data.area.first!.fragments.locationAreaFragment
        return LocationArea(fragment)
    }

    // MARK: - Move

    public func fetchMoveSummaryList(limit: Int? = nil, offset: Int? = nil) async throws -> [Move.Summary] {
        let query = GraphClient.GetMoveSummaryListQuery(limit: GraphQLNullable(limit), offset: GraphQLNullable(offset))
        let data = try await fetch(query: query)
        return data.moves.compactMap { Move.Summary($0.fragments.moveSummaryFragment) }
    }

    public func fetchMove(name: Move.Name) async throws -> Move {
        let query = GraphClient.GetMoveByNameQuery(name: name.rawValue)
        let data = try await fetch(query: query)
        // throw error here
        let fragment = data.move.first!.fragments.moveFragment
        return Move(fragment)
    }

    // MARK: - Helpers

    func fetch<Query: GraphQLQuery>(query: Query) async throws -> Query.Data {
        try await withCheckedThrowingContinuation { continuation in
            apollo.fetch(query: query) { result in
                switch result {
                case let .success(graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    } else if let error = graphQLResult.errors?.first {
                        continuation.resume(throwing: error)
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

extension GraphQLNullable where Wrapped == Int {
    init(_ value: Int?) {
        if let value {
            self = .some(value)
        } else {
            self = .none
        }
    }
}
