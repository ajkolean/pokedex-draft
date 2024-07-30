import Foundation
import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct ItemCategory: Hashable, Codable, Identifiable, Sendable {
    public typealias Name = Identifier<String>
    public typealias ID = Identifier<Int>

    public var id: ID { ID(rawValue: _id) }

    public var name: Name { Name(rawValue: _name) }

    public let _id: Int
    public let _name: String
    public var items: [Item]
    public let pocket: String?
}

extension [ItemCategory] {
    public var allItems: [Item] {
        flatMap(\.items)
    }
}
