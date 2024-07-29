import Foundation
import Models

extension PokemonType {
    init(_ apiModel: GraphClient.TypeFragment) {
        let id = apiModel.id
        let type = PokemonTypeEnum(rawValue: apiModel.name) ?? .unknown
        let attackDamageRelations = apiModel.attackDamageRelations.map {
            DamageRelation(
                damageFactor: $0.damageFactor,
                targetType: PokemonTypeEnum(rawValue: $0.targetType?.name ?? "") ?? .unknown
            )
        }
        let defenseDamageRelations = apiModel.defenseDamageRelation.map {
            DamageRelation(
                damageFactor: $0.damageFactor,
                targetType: PokemonTypeEnum(rawValue: $0.targetType?.name ?? "") ?? .unknown
            )
        }
        let pokemonByTypeSlot = apiModel.pokemonByTypeSlot.compactMap { data -> PokemonByTypeSlot? in
            guard let fragment = data.pokemon?.fragments.pokemonSummaryFragment else { return nil }
            return PokemonByTypeSlot(slot: data.typeSlot, pokemonID: data.pokemonID ?? 0, pokemon: PokemonSummary(fragment))
        }

        self.init(
            _id: id,
            type: type,
            attackDamageRelations: attackDamageRelations,
            defenseDamageRelations: defenseDamageRelations,
            pokemonByTypeSlot: pokemonByTypeSlot
        )
    }
}
