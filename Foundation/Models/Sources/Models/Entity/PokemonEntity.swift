import SwiftData

@Model
public final class PokemonEntity {
    @Attribute(.unique)
    public var name: String
    public var details: PokemonDetailsEntity
    public var species: PokemonSpeciesEntity

    public init(name: String, details: PokemonDetailsEntity, species: PokemonSpeciesEntity) {
        self.name = name
        self.details = details
        self.species = species
    }

    public var asModel: Pokemon {
        .init(details: details.asEntity, species: species.asModel)
    }
}
