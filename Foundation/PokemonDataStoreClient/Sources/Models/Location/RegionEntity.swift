import Models
import SwiftData

@Model
public final class RegionEntity {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var generation: Generation?

    public init(id: Int, name: String, generation: Generation?) {
        self.id = id
        self.name = name
        self.generation = generation
    }
}

extension RegionEntity {
    convenience init(_ model: Region) {
        self.init(
            id: model._id,
            name: model._name,
            generation: model.generation
        )
    }
}

extension Region {
    init(_ model: RegionEntity) {
        self.init(
            _id: model.id,
            _name: model.name,
            generation: model.generation
        )
    }
}
