import ComposableArchitecture
import Foundation
import Models
import TCGNetworkClientInterface

extension TCGNetworkClient: @retroactive DependencyKey {
    public static let liveValue: TCGNetworkClient = {
        let service = TCGAPIService()
        return TCGNetworkClient(
            fetchAllTCGSets: {
                try await service.fetchAllTCGSets()
            },
            fetchTCGCardsBySetID: { id in
                try await service.fetchTCGCardsBySetID(id)
            },
            fetchCardsByPokemonName: { pokemonName in
                try await service.fetchCardsByPokemonName(pokemonName)
            }
        )
    }()
}
