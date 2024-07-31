import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct TCGNetworkClient: Sendable {
    public var fetchAllTCGSets: @Sendable () async throws -> TCG.SetList
    public var fetchTCGCardsBySetName: @Sendable (_ setName: TCG.Set.Name) async throws -> TCG.CardList
    public var fetchCardsByPokemonName: @Sendable (_ pokemonName: TCG.Card.Name) async throws -> TCG.CardList
}

extension TCGNetworkClient: TestDependencyKey {
    public static var testValue: Self { Self() }
}

extension DependencyValues {
    public var tcgAPIClient: TCGNetworkClient {
        get { self[TCGNetworkClient.self] }
        set { self[TCGNetworkClient.self] = newValue }
    }
}
