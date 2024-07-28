import PokemonGraphClientInterface
import SwiftData

@Model
public final class PokemonEntity {
    public let id: Pokemon.ID
    @Attribute(.unique)
    public let name: Pokemon.Name
    public let height: Int?
    public let weight: Int?
    public let order: Int?
    public let baseExperience: Int?
    public let types: [Pokemon.TypeSlot]
    public let stats: [Pokemon.Stat]
    public let descriptions: [String]

    public init(
        id: Pokemon.ID,
        name: Pokemon.Name,
        height: Int? = nil,
        weight: Int? = nil,
        order: Int? = nil,
        baseExperience: Int? = nil,
        types: [Pokemon.TypeSlot],
        stats: [Pokemon.Stat],
        descriptions: [String],
        _$backingData: any BackingData<PokemonEntity> = PokemonEntity.createBackingData()
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
        self._$backingData = _$backingData
    }
}

extension PokemonEntity {
    convenience init(_ model: Pokemon) {
        self.init(
            id: model.id, name: model.name, height: model.height, weight: model.weight, order: model.order, baseExperience: model.baseExperience, types: model.types, stats: model.stats, descriptions: model.descriptions)
    }
}

extension Pokemon {
    init(_ model: PokemonEntity) {
        self.init(
            id: model.id, name: model.name, height: model.height, weight: model.weight, order: model.order, baseExperience: model.baseExperience, types: model.types, stats: model.stats, descriptions: model.descriptions)
    }
}
