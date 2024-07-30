import ComposableArchitecture
import Foundation
import Models
import PokemonGraphClientInterface

extension PokemonAPIClient: DependencyKey {
    public static let liveValue: PokemonAPIClient = {
        let client = APIService()
        return PokemonAPIClient(
            fetchPokemonSummaryList: { try await client.fetchPokemonSummaryList() },
            fetchPokemon: { try await client.fetchPokemon(name: $0) },
            fetchPokemonTypeList: { try await client.fetchPokemoTypenList() },
            fetchItemCategoryList: { try await client.fetchItemCategoryList() },
            fetchRegionList: { try await client.fetchRegionList() },
            fetchLocationsList: { try await client.fetchLocationsList(id: $0) },
            fetchLocationArea: { try await client.fetchLocationArea(id: $0) },
            fetchMoveSummaryList: { try await client.fetchMoveSummaryList() },
            fetchMove: { try await client.fetchMove(name: $0) }
        )
    }()
}
