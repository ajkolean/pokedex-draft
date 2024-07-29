
import Models
import SwiftData

@Model
public final class PokemonEntity {
    @Attribute(.unique)
    public let id: Int
    public let name: String
    public let height: Int?
    public let weight: Int?
    public let order: Int?
    public let baseExperience: Int?
    public let types: [Pokemon.TypeSlot]
    public let stats: [Pokemon.Stat]
    public let descriptions: [String]

    public init(
        id: Int,
        name: String,
        height: Int? = nil,
        weight: Int? = nil,
        order: Int? = nil,
        baseExperience: Int? = nil,
        types: [Pokemon.TypeSlot],
        stats: [Pokemon.Stat],
        descriptions: [String]
    ) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.order = order
        self.baseExperience = baseExperience
        self.types = types
        self.stats = stats
        self.descriptions = descriptions
    }
}

extension PokemonEntity {
    convenience init(_ model: Pokemon) {
        self.init(
            id: model._id, name: model._name, height: model.height, weight: model.weight, order: model.order,
            baseExperience: model.baseExperience, types: model.types, stats: model.stats, descriptions: model.descriptions
        )
    }
}

extension Pokemon {
    init(_ model: PokemonEntity) {
        self.init(
            _id:  model.id, _name: model.name, height: model.height,
            weight: model.weight, order: model.order, baseExperience: model.baseExperience, types: model.types,
            stats: model.stats, descriptions: model.descriptions
        )
    }
}
