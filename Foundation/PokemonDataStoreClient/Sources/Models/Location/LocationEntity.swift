import Models
import SwiftData

@Model
public final class LocationEntity {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var areas: [Location.Area]

    public init(id: Int, name: String, areas: [Location.Area]) {
        self.id = id
        self.name = name
        self.areas = areas
    }
}

extension LocationEntity {
    convenience init(_ model: Location) {
        self.init(
            id: model._id,
            name: model._name,
            areas: model.areas
        )
    }
}

extension Location {
    init(_ model: LocationEntity) {
        self.init(
            _id: model.id,
            _name: model.name,
            areas: model.areas
        )
    }
}
