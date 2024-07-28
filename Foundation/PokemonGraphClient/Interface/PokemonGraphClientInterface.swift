import Apollo
import ComposableArchitecture
import Foundation

@DependencyClient
public struct PokemonAPIClient: Sendable {
    public var fetchPokemonList: @Sendable () async throws -> [Pokemon]
    public var fetchPokemonTypeList: @Sendable () async throws -> [PokemonType]
}

extension PokemonAPIClient: DependencyKey {
    public static let liveValue: PokemonAPIClient = {
        let client = APIService()
        return PokemonAPIClient(
            fetchPokemonList: { try await client.fetchPokemonList() },
            fetchPokemonTypeList: { try await client.fetchPokemoTypenList() }
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

    public func fetchPokemonList(limit: Int? = 20, offset: Int? = nil) async throws -> [Pokemon] {
        let query = GraphClient.GetPokemonListQuery(limit: GraphQLNullable(limit), offset: GraphQLNullable(offset))
        let data = try await fetch(query: query)
        let p = data.pokemons.compactMap { Pokemon($0.fragments.pokemonFragment) }
        print(p)
        return p
    }

    public func fetchPokemon(name: String) async throws -> Pokemon {
        let query = GraphClient.GetPokemonByNameQuery(name: name)
        let data = try await fetch(query: query)
        let fragment = data.pokemon.first!.fragments.pokemonFragment
        return Pokemon(fragment)
    }

    public func fetchPokemoTypenList(limit: Int? = 20, offset: Int? = nil) async throws -> [PokemonType] {
        let query = GraphClient.GetPokemonTypeListQuery(limit: GraphQLNullable(limit), offset: GraphQLNullable(offset))
        let data = try await fetch(query: query)
        return data.types.compactMap { PokemonType($0.fragments.typeFragment) }
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
