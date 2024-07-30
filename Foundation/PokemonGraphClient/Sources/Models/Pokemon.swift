import Foundation
import Models

extension Pokemon {
    init(_ apiModel: GraphClient.PokemonFragment) {
        let types = apiModel.types.map { Pokemon.TypeSlot(
            slot: $0.slot,
            type: PokemonTypeEnum(rawValue: $0.type?.name ?? "") ?? .unknown
        ) }
        let stats = apiModel.stats.map { Stat(baseStat: $0.base_stat, effort: $0.effort, name: $0.statName?.name ?? "") }
        let descriptions = apiModel.species?.descriptions.map(\.text).map(\.cleaned) ?? []
        self.init(
            id: Pokemon.ID(rawValue: apiModel.id),
            name: Pokemon.Name(rawValue: apiModel.name),
            height: apiModel.height,
            weight: apiModel.weight,
            order: apiModel.order,
            baseExperience: apiModel.baseExperience,
            types: types,
            stats: stats,
            descriptions: descriptions
        )
    }
}
