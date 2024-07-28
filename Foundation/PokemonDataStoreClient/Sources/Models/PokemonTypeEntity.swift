import Models
import SwiftData

@Model
public final class PokemonTypeEntity: Sendable {
    @Attribute(.unique)
    public let id: Int
    public let type: PokemonTypeEnum
    public let attackDamageRelations: [PokemonType.DamageRelation]
    public let defenseDamageRelations: [PokemonType.DamageRelation]
    public let pokemonByTypeSlot: [PokemonByTypeSlot]

    public init(
        id: PokemonType.ID,
        type: PokemonTypeEnum,
        attackDamageRelations: [PokemonType.DamageRelation],
        defenseDamageRelations: [PokemonType.DamageRelation],
        pokemonByTypeSlot: [PokemonByTypeSlot]
    ) {
        self.id = id.rawValue
        self.type = type
        self.attackDamageRelations = attackDamageRelations
        self.defenseDamageRelations = defenseDamageRelations
        self.pokemonByTypeSlot = pokemonByTypeSlot
    }
}

extension PokemonTypeEntity {
    convenience init(_ model: PokemonType) {
        self.init(
            id: model.id,
            type: model.type,
            attackDamageRelations: model.attackDamageRelations,
            defenseDamageRelations: model.defenseDamageRelations,
            pokemonByTypeSlot: model.pokemonByTypeSlot
        )
    }
}

extension PokemonType {
    init(_ model: PokemonTypeEntity) {
        self.init(
            _id: model.id,
            type: model.type,
            attackDamageRelations: model.attackDamageRelations,
            defenseDamageRelations: model.defenseDamageRelations,
            pokemonByTypeSlot: model.pokemonByTypeSlot
        )
    }
}
