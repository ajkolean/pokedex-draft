import Foundation
import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct LocationArea: Hashable, Codable, Identifiable, Sendable {
    public let _id: Int
    public let _name: String
    public let encouters: [Encounter]

    @MemberwiseInit(.public)
    public struct Encounter: Hashable, Codable, Sendable {
        public let minLevel: Int?
        public let maxLevel: Int
        public let pokemon: PokemonSummary
    }
}

extension LocationArea {
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

extension Array {
    public func filterRemovingDuplicates<T: Hashable>(_ keyProvider: (Element) -> T) -> [Element] {
        var seenKeys = Set<T>()
        return filter { element in
            let key = keyProvider(element)
            guard !seenKeys.contains(key) else {
                return false
            }
            seenKeys.insert(key)
            return true
        }
    }
}
