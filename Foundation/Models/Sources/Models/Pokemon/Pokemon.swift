import Foundation
@_exported import MemberwiseInit

// MARK: - Pokemon

public protocol PokemonConforming {
    var id: Pokemon.ID { get }
    var name: Pokemon.Name { get }
    var types: [Pokemon.TypeSlot] { get }
}

public struct Pokemon: Hashable, Codable, Identifiable, Sendable, PokemonConforming {
    public typealias Name = Identifier<String>
    public typealias ID = Identifier<Int>

    public var id: ID { ID(rawValue: _id) }

    public var name: Name { Name(rawValue: _name) }

    private let _id: Int
    private let _name: String

    public let height: Int?
    public let weight: Int?
    public let order: Int?
    public let baseExperience: Int?
    public let types: [TypeSlot]
    public let stats: [Stat]
    public let descriptions: [String]

    // MARK: - PokemonType

    public struct TypeSlot: Hashable, Codable, Sendable {
        public let slot: Int
        public let type: PokemonTypeEnum

        public init(
            slot: Int,
            type: PokemonTypeEnum
        ) {
            self.slot = slot
            self.type = type
        }
    }

    // MARK: - PokemonStat

    public struct Stat: Hashable, Codable, Sendable {
        public let baseStat: Int
        public let effort: Int
        public let name: String

        public init(
            baseStat: Int,
            effort: Int,
            name: String
        ) {
            self.baseStat = baseStat
            self.effort = effort
            self.name = name
        }
    }

    public init(
        id: Pokemon.ID,
        name: Pokemon.Name,
        height: Int?,
        weight: Int?,
        order: Int?,
        baseExperience: Int?,
        types: [TypeSlot],
        stats: [Stat],
        descriptions: [String]
    ) {
        _id = id.rawValue
        _name = name.rawValue
        self.height = height
        self.weight = weight
        self.order = order
        self.baseExperience = baseExperience
        self.types = types
        self.stats = stats
        self.descriptions = descriptions
    }
}

extension PokemonConforming {
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }

    public var primaryType: PokemonTypeEnum {
        let type = types.first { $0.slot == 1 }
        return type?.type ?? .unknown
    }
}
