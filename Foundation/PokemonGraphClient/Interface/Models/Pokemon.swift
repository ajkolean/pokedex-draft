import Apollo
import Foundation
import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct Pokemon: Hashable, Codable, Identifiable, Sendable {
    public let id: ID
    public let name: Name
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

    // MARK: - PokemonID

    public struct ID: Codable, IdentifierProtocol, ExpressibleByIntegerLiteral {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    // MARK: - PokemonType

    public struct TypeSlot: Hashable, Codable, Sendable {
        public let slot: Int
        public let type: PokemonTypeEnum
    }

    // MARK: - PokemonStat

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

extension Pokemon {
    init(_ apiModel: GraphClient.PokemonFragment) {
        let types = apiModel.types.map { Pokemon.TypeSlot(
            slot: $0.slot,
            type: PokemonTypeEnum(rawValue: $0.type?.name ?? "") ?? .unknown
        ) }
        let stats = apiModel.stats.map { Stat(baseStat: $0.base_stat, effort: $0.effort, name: $0.statName?.name ?? "") }
        let descriptions = apiModel.species?.descriptions.map(\.text) ?? []
        self.init(
            id: Pokemon.ID(rawValue: apiModel.id),
            name: Pokemon.Name(rawValue: apiModel.name),
            height: apiModel.height,
            weight: apiModel.weight,
            order: apiModel.order,
            baseExperience: apiModel.baseExperience,
            types: types,
            stats: stats,
            descriptions: descriptions
        )
    }
}
