import ComposableArchitecture
import Foundation
import Models
import TCGNetworkClientInterface

extension TCGNetworkClient: DependencyKey {
    public static let liveValue: TCGNetworkClient = {
        let service = TCGAPIService()
        return TCGNetworkClient(
            fetchAllTCGSets: {
                try await service.fetchAllTCGSets()
            },
            fetchTCGCardsBySetName: { setName in
                try await service.fetchTCGCardsBySetName(setName)
            },
            fetchCardsByPokemonName: { pokemonName in
                try await service.fetchCardsByPokemonName(pokemonName)
            }
        )
    }()
}
