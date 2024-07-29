import Foundation

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct PokemonSummary: Hashable, Codable, Identifiable, Sendable, PokemonConforming {
    public let _id: Int
    public let _name: String
    public let types: [Pokemon.TypeSlot]

    public var id: Pokemon.ID { .init(rawValue: _id) }
    public var name: Pokemon.Name { .init(rawValue: _name) }
}
