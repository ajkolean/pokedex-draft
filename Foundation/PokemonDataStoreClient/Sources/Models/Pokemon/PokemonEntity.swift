import Models
import SwiftData

@Model
public final class PokemonEntity {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var height: Int?
    public var weight: Int?
    public var order: Int?
    public var baseExperience: Int?
    public var types: [Pokemon.TypeSlot]
    public var stats: [Pokemon.Stat]
    public var descriptions: [String]

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
            id: model.id.rawValue, name: model.name.rawValue, height: model.height, weight: model.weight, order: model.order,
            baseExperience: model.baseExperience, types: model.types, stats: model.stats, descriptions: model.descriptions
        )
    }
}

extension Pokemon {
    init(_ model: PokemonEntity) {
        self.init(
            id: Pokemon.ID(rawValue: model.id), name: Pokemon.Name(rawValue: model.name), height: model.height,
            weight: model.weight, order: model.order, baseExperience: model.baseExperience, types: model.types,
            stats: model.stats, descriptions: model.descriptions
        )
    }
}
