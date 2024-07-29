import Foundation
@_exported import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct Pokemon: Hashable, Codable, Identifiable, Sendable {
    public let _id: Int
    public let _name: String
    public let height: Int?
    public let weight: Int?
    public let order: Int?
    public let baseExperience: Int?
    public let types: [TypeSlot]
    public let stats: [Stat]
    public let descriptions: [String]

    // MARK: - PokemonName

    public struct Name: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    public var name: Name { .init(rawValue: _name) }

    // MARK: - PokemonID

    public struct ID: Codable, IdentifierProtocol, ExpressibleByIntegerLiteral {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    public var id: ID { .init(rawValue: _id) }

    // MARK: - PokemonType

    @MemberwiseInit(.public)
    public struct TypeSlot: Hashable, Codable, Sendable {
        public let slot: Int
        public let type: PokemonTypeEnum
    }

    // MARK: - PokemonStat

    @MemberwiseInit(.public)
    public struct Stat: Hashable, Codable, Sendable {
        public let baseStat: Int
        public let effort: Int
        public let name: String
    }
}

extension Pokemon {
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }

    public var primaryType: PokemonTypeEnum {
        let type = types.first { $0.slot == 1 }
        return type?.type ?? .unknown
    }
}
