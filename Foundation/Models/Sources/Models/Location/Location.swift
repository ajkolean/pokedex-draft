import Foundation
import MemberwiseInit

// MARK: - Pokemon

public struct Location: Hashable, Codable, Identifiable, Sendable {
    public let _id: Int
    public let _name: String
    public let areas: [Area]

    @MemberwiseInit(.public)
    public struct Area: Hashable, Codable, Identifiable, Sendable {
        public let _id: Int
        public let _name: String

        public var id: LocationArea.ID { .init(rawValue: _id) }
        public var name: LocationArea.Name { .init(rawValue: _name) }
    }

    public init(_id: Int, _name: String, areas: [Location.Area]) {
        self._id = _id
        self._name = _name
        self.areas = areas
    }
}

extension Location {
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
}

extension [Location] {
    public var allAreas: [Location.Area] {
        flatMap(\.areas)
    }
}
