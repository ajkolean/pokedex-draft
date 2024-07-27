import Foundation
import SwiftData

public struct PokemonSpecies: Codable, Hashable, Sendable {
    public let name: String
    public let flavorTextEntries: [FlavorTextEntry]

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"

        case name
    }

    public var asEntity: PokemonSpeciesEntity {
        .init(name: name, flavorTextEntries: flavorTextEntries)
    }
}

public struct FlavorTextEntry: Codable, Hashable, Sendable {
    public let flavorText: String

    public init(flavorText: String) {
        self.flavorText = flavorText
    }

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
    }
}
