import Models
import SwiftData

@Model
public final class MoveEntity {
    @Attribute(.unique)
    public let id: Int
    public let name: String
    public let summary: Move.Summary
    public let damageClass: Move.DamageClass
    public let generation: Generation
    public let pokemon: [PokemonSummary]
    
    public init(id: Int, name: String, summary: Move.Summary, damageClass: Move.DamageClass, generation: Generation, pokemon: [PokemonSummary]) {
        self.id = id
        self.name = name
        self.summary = summary
        self.damageClass = damageClass
        self.generation = generation
        self.pokemon = pokemon
    }
}

extension MoveEntity {
    convenience init(_ model: Move) {
        self.init(id: model.id.rawValue, name: model.summary.name.rawValue, summary: model.summary, damageClass: model.damageClass, generation: model.generation, pokemon: model.pokemon)
    }
}

extension Move {
    init(_ model: MoveEntity) {
        self.init(summary: model.summary, damageClass: model.damageClass, generation: model.generation, pokemon: model.pokemon)
    }
}
