import Foundation

public struct Pokemon: Identifiable, Codable, Hashable {
    public var id: Int { details.id }

    public let details: PokemonDetails
    public let species: PokemonSpecies

    public init(details: PokemonDetails, species: PokemonSpecies) {
        self.details = details
        self.species = species
    }
}

extension Pokemon {
    public var description: String {
        let description = species.flavorTextEntries.first?.flavorText ?? "This Pokemon doesn't have a description"
        dump(description)
        return description.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\u{0C}", with: " ")
    }
}
