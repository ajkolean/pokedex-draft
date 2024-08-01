import Models
import SwiftData

@Model
public final class MoveSummaryEntity {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var accuracy: Int?
    public var power: Int?
    public var pp: Int?
    public var priority: Int?
    public var type: PokemonTypeEnum

    public init(id: Int, name: String, accuracy: Int?, power: Int?, pp: Int?, priority: Int?, type: PokemonTypeEnum) {
        self.id = id
        self.name = name
        self.accuracy = accuracy
        self.power = power
        self.pp = pp
        self.priority = priority
        self.type = type
    }
}

extension MoveSummaryEntity {
    convenience init(_ model: Move.Summary) {
        self.init(
            id: model.id.rawValue,
            name: model.name.rawValue,
            accuracy: model.accuracy,
            power: model.power,
            pp: model.pp,
            priority: model.priority,
            type: model.type
        )
    }
}

extension Move.Summary {
    init(_ model: MoveSummaryEntity) {
        self.init(
            id: Move.ID(rawValue: model.id),
            name: Move.Name(rawValue: model.name),
            accuracy: model.accuracy,
            power: model.power,
            pp: model.pp,
            priority: model.priority,
            type: model.type
        )
    }
}
