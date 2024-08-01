import ComposableArchitecture
import Foundation
import Models

@DependencyClient
public struct TCGNetworkClient: Sendable {
    public var fetchAllTCGSets: @Sendable () async throws -> TCG.SetList
    public var fetchTCGCardsBySetID: @Sendable (_ setID: TCG.SetID) async throws -> TCG.CardList
    public var fetchCardsByPokemonName: @Sendable (_ pokemonName: TCG.CardName) async throws -> TCG.CardList
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
