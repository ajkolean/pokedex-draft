import Models
import SwiftData

@Model
public final class MoveSummaryEntity {
    @Attribute(.unique)
    public let id: Int
    public let name: String
    public let accuracy: Int?
    public let power: Int?
    public let pp: Int?
    public let type: PokemonTypeEnum
  
    public init(id: Int, name: String, accuracy: Int?, power: Int?, pp: Int?, type: PokemonTypeEnum) {
        self.id = id
        self.name = name
        self.accuracy = accuracy
        self.power = power
        self.pp = pp
        self.type = type
    }
}

extension MoveSummaryEntity {
    convenience init(_ model: Move.Summary) {
        self.init(id: model.id.rawValue, name: model.name.rawValue, accuracy: model.accuracy, power: model.power, pp: model.pp, type: model.type)
    }
}

extension Move.Summary {
    init(_ model: MoveSummaryEntity) {
        self.init(id: Move.ID(rawValue: model.id), name: Move.Name(rawValue: model.name), accuracy: model.accuracy, power: model.power, pp: model.pp, type: model.type)
    }
}
