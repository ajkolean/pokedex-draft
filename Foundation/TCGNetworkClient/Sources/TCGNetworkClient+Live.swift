import ComposableArchitecture
import Foundation
import Models
import TCGNetworkClientInterface

extension TCGNetworkClient: DependencyKey {
    public static let liveValue: TCGNetworkClient = {
        let service = TCGAPIService()
        return TCGNetworkClient(
            fetchAllSets: {
                try await service.fetchAllSets()
            },
            fetchCardsBySetName: { setName in
                try await service.fetchCardsBySetName(setName)
            },
            fetchCardsByPokemonName: { pokemonName in
                try await service.fetchCardsByPokemonName(pokemonName)
            }
        )
    }()
}
