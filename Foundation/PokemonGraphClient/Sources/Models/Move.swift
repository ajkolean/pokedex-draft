import Foundation
import Models

extension Move.Summary {
    init(_ apiModel: GraphClient.MoveSummaryFragment) {
        let type = apiModel.pokemonType.map { PokemonTypeEnum(rawValue: $0.name) } ?? .unknown
        self.init(
            id: Move.ID(rawValue: apiModel.id),
            name: Move.Name(rawValue: apiModel.name),
            accuracy: apiModel.accuracy,
            power: apiModel.power,
            pp: apiModel.pp,
            priority: apiModel.priority,
            type: type ?? .unknown
        )
    }
}

extension Move {
    init(_ apiModel: GraphClient.MoveFragment) {
        let descriptions = apiModel.flavorTexts.map { $0.text }
        let moveEffectChance = apiModel.moveEffectChance
        let moveEffectTexts = apiModel.moveEffect?.moveEffectTexts.map { $0.effect } ?? []
        let summary = Move.Summary(apiModel.fragments.moveSummaryFragment)
        // Probably shouldn't default to physical
        let damageClass = apiModel.damageClass.map { DamageClass(rawValue: $0.name) } ?? .physical
        let pokemon = apiModel.pokemonMoves
            .compactMap { $0.pokemon?.fragments.pokemonSummaryFragment }
            .map(PokemonSummary.init)
        self.init(
            summary: summary,
            damageClass: damageClass ?? .physical,
            generation: Generation(_id: apiModel.id, _name: apiModel.name),
            pokemon: pokemon,
            descriptions: descriptions,
            moveEffectChance: moveEffectChance,
            moveEffectTexts: moveEffectTexts
        )
    }
}
