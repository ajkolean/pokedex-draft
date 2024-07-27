import Apollo
import ComposableArchitecture
import Foundation

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
