import Foundation
import SwiftData

public struct Pokemon: Identifiable, Codable, Hashable {
    public var id: String { name }
    public var name: String { details.name }

    public let details: PokemonDetails
    public let species: PokemonSpecies

    public init(details: PokemonDetails, species: PokemonSpecies) {
        self.details = details
        self.species = species
    }

    public var asEntity: PokemonEntity {
        .init(name: details.name, details: details.asEntity, species: species.asEntity)
    }
}

extension Pokemon {
    public var description: String {
        let description = species.flavorTextEntries.first?.flavorText ?? "This Pokemon doesn't have a description"
        return description.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\u{0C}", with: " ")
    }
}
