import Models
import SwiftData

@Model
public final class PokemonSummaryEntity {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var types: [Pokemon.TypeSlot]

    public init(id: Int, name: String, types: [Pokemon.TypeSlot]) {
        self.id = id
        self.name = name
        self.types = types
    }
}

extension PokemonSummaryEntity {
    convenience init(_ model: PokemonSummary) {
        self.init(
            id: model._id, name: model._name, types: model.types
        )
    }
}

extension PokemonSummary {
    init(_ model: PokemonSummaryEntity) {
        self.init(
            _id: model.id, _name: model.name, types: model.types
        )
    }
}
