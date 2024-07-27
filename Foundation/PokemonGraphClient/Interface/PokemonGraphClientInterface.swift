import Apollo
import Foundation
import ComposableArchitecture

@DependencyClient
public struct PokemonAPIClient: Sendable {
    public var fetchPokemon: @Sendable () async throws -> [Pokemon]
}

extension PokemonAPIClient: DependencyKey {
    public static let liveValue: PokemonAPIClient = {
        let client = APIService()
        return PokemonAPIClient(
            fetchPokemon: { try await client.fetchPokemon() }
        )
    }()
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


private actor APIService {
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://beta.pokeapi.co/graphql/v1beta")!)
    
    public init() {}
    

    public func fetchPokemon(limit: Int? = 20, offset: Int? = nil) async throws -> [Pokemon] {
        let limit: GraphQLNullable<Int> = limit.map { .some($0) } ?? .none
        let offset: GraphQLNullable<Int> = offset.map { .some($0) } ?? .none

        let query = GraphClient.GetPokemonQuery(limit: limit, offset: offset)
        let data = try await fetch(query: query)
        let p = data.pokemon.compactMap { Pokemon($0) }
        print(p)
        return p
    }
    
    // MARK: - Helpers
    
    func fetch<Query: GraphQLQuery>(query: Query) async throws -> Query.Data {
        try await withCheckedThrowingContinuation { continuation in
            apollo.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    } else if let error = graphQLResult.errors?.first {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

// MARK: - Pokemon
public struct Pokemon: Hashable, Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let height: Int?
    public let weight: Int?
    public  let order: Int?
    public  let baseExperience: Int?
    public  let types: [PokemonType]
    public let stats: [Stat]
    public let descriptions: [String]
    
    public  // MARK: - PokemonType
    struct PokemonType: Hashable, Codable, Sendable {
        public let slot: Int
        public let name: String
    }
    
    // MARK: - PokemonStat
    public  struct Stat: Hashable, Codable, Sendable {
        public let baseStat: Int
        public let effort: Int
        public let name: String
    }
    
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}

extension Pokemon {
    init(_ apiModel: GraphClient.GetPokemonQuery.Data.Pokemon) {
        let types = apiModel.types.map { PokemonType(slot: $0.slot, name: $0.type?.name ?? "") }
        let stats = apiModel.stats.map { Stat(baseStat: $0.base_stat, effort: $0.effort, name: $0.statName?.name ?? "") }
        let descriptions = apiModel.species?.descriptions.map { $0.text } ?? []
        self.init(id: apiModel.id, name: apiModel.name, height: apiModel.height, weight: apiModel.weight, order: apiModel.order, baseExperience: apiModel.baseExperience, types: types, stats: stats, descriptions: descriptions)
    }
}
