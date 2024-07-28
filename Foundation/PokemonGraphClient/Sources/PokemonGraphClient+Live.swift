import ComposableArchitecture
import Foundation
import Models
import PokemonGraphClientInterface

extension PokemonAPIClient: DependencyKey {
    public static let liveValue: PokemonAPIClient = {
        let client = APIService()
        return PokemonAPIClient(
            fetchPokemonList: { try await client.fetchPokemonList() },
            fetchPokemonTypeList: { try await client.fetchPokemoTypenList() }
        )
    }()
}
