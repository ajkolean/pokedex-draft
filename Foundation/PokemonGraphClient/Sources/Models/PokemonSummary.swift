import Foundation
import Models

extension PokemonSummary {
    init(_ apiModel: GraphClient.PokemonSummaryFragment) {
        let types = apiModel.types.map { Pokemon.TypeSlot(
            slot: $0.slot,
            type: PokemonTypeEnum(rawValue: $0.type?.name ?? "") ?? .unknown
        ) }
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            types: types
        )
    }
}
