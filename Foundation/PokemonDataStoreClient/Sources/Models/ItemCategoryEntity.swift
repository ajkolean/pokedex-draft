import Models
import SwiftData

@Model
public final class ItemCategoryEntity {
    @Attribute(.unique)
    public let id: Int
    public let name: String
    public let items: [Item]
    public let pocket: String?

    public init(id: Int, name: String, items: [Item], pocket: String? = nil) {
        self.id = id
        self.name = name
        self.items = items
        self.pocket = pocket
    }
}

extension ItemCategoryEntity {
    convenience init(_ model: ItemCategory) {
        self.init(
            id: model._id,
            name: model._name,
            items: model.items,
            pocket: model.pocket
        )
    }
}

extension ItemCategory {
    init(_ model: ItemCategoryEntity) {
        self.init(
            _id: model.id,
            _name: model.name,
            items: model.items,
            pocket: model.pocket
        )
    }
}
