import Foundation
import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct Item: Hashable, Codable, Identifiable, Sendable {
    public typealias Name = Identifier<String>
    public typealias ID = Identifier<Int>

    public var id: ID { ID(rawValue: _id) }

    public var name: Name { Name(rawValue: _name) }

    public let _id: Int
    public let _name: String
    public let flingPower: Int?
    public let cost: Int?
    public let flavorText: String?
    public let effectText: String?
    public let flingEffect: String?

    public var imageUrl: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/\(name).png")!
    }
}
