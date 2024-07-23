import SwiftData

@Model
public final class PokemonSpeciesEntity {
    public let name: PokemonName
    public let flavorTextEntries: [FlavorTextEntry]

    public init(name: PokemonName, flavorTextEntries: [FlavorTextEntry]) {
        self.name = name
        self.flavorTextEntries = flavorTextEntries
    }
    
    public var asModel: PokemonSpecies {
        .init(name: name, flavorTextEntries: flavorTextEntries)
    }
}
