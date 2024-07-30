import Foundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct Move: Hashable, Codable, Identifiable, Sendable {
    public enum DamageClass: String, Hashable, Codable, Sendable {
        case status
        case physical
        case special
    }

    @MemberwiseInit(.public)
    public struct Summary: Hashable, Codable, Identifiable, Sendable {
        public let id: Move.ID
        public let name: Move.Name
        public let accuracy: Int?
        public let power: Int?
        public let pp: Int?
        public let type: PokemonTypeEnum

        public var accuracyString: String {
            accuracy.map { "\($0)" } ?? "???"
        }

        public var ppString: String {
            pp.map { "\($0)" } ?? "???"
        }

        public var powerString: String {
            power.map { "\($0)" } ?? "???"
        }
    }

    public let summary: Summary
    public let damageClass: DamageClass
    public let generation: Generation
    public let pokemon: [PokemonSummary]

    public var id: ID { summary.id }
}

extension Move {
    public struct Name: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    public struct ID: Codable, IdentifierProtocol, ExpressibleByIntegerLiteral {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
