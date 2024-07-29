import Models
import SwiftData

@Model
public final class LocationAreaEntity {
    @Attribute(.unique)
    public let id: Int
    public let name: String
    public let encouters: [LocationArea.Encounter]

    public init(id: Int, name: String, encouters: [LocationArea.Encounter]) {
        self.id = id
        self.name = name
        self.encouters = encouters
    }
}

extension LocationAreaEntity {
    convenience init(_ model: LocationArea) {
        self.init(
            id: model._id,
            name: model._name,
            encouters: model.encouters
        )
    }
}

extension LocationArea {
    init(_ model: LocationAreaEntity) {
        self.init(
            _id: model.id,
            _name: model.name,
            encouters: model.encouters
        )
    }
}
