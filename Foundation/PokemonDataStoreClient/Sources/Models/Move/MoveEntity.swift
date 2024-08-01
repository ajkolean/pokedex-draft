import Models
import SwiftData

@Model
public final class MoveEntity {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var summary: Move.Summary
    public var damageClass: Move.DamageClass
    public var generation: Generation
    public var pokemon: [PokemonSummary]
    public var descriptions: [String]
    public var moveEffectChance: Int?
    public var moveEffectTexts: [String]

    public init(
        id: Int,
        name: String,
        summary: Move.Summary,
        damageClass: Move.DamageClass,
        generation: Generation,
        pokemon: [PokemonSummary],
        descriptions: [String],
        moveEffectChance: Int?,
        moveEffectTexts: [String]
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.damageClass = damageClass
        self.generation = generation
        self.pokemon = pokemon
        self.descriptions = descriptions
        self.moveEffectChance = moveEffectChance
        self.moveEffectTexts = moveEffectTexts
    }
}

extension MoveEntity {
    convenience init(_ model: Move) {
        self.init(
            id: model.id.rawValue,
            name: model.summary.name.rawValue,
            summary: model.summary,
            damageClass: model.damageClass,
            generation: model.generation,
            pokemon: model.pokemon,
            descriptions: model.descriptions,
            moveEffectChance: model.moveEffectChance,
            moveEffectTexts: model.moveEffectTexts
        )
    }
}

extension Move {
    init(_ model: MoveEntity) {
        self.init(
            summary: model.summary,
            damageClass: model.damageClass,
            generation: model.generation,
            pokemon: model.pokemon,
            descriptions: model.descriptions,
            moveEffectChance: model.moveEffectChance,
            moveEffectTexts: model.moveEffectTexts
        )
    }
}
