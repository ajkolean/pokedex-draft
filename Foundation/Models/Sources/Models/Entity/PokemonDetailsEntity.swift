import SwiftData

@Model
public final class PokemonDetailsEntity {
    @Attribute(.unique)
    public var name: PokemonName
    public var baseExperience: Int
    public var height: Int
    public var id: Int
    public var order: Int
    public var species: PokemonForm
    public var stats: [Stat]
    public var types: [PokemonType]
    public var weight: Int

    public init(
        baseExperience: Int,
        height: Int,
        id: Int,
        name: PokemonName,
        order: Int,
        species: PokemonForm,
        stats: [Stat],
        types: [PokemonType],
        weight: Int
    ) {
        self.baseExperience = baseExperience
        self.height = height
        self.id = id
        self.name = name
        self.order = order
        self.species = species
        self.stats = stats
        self.types = types
        self.weight = weight
    }

    public var asEntity: PokemonDetails {
        .init(
            baseExperience: baseExperience,
            height: height,
            id: id,
            name: name,
            order: order,
            species: species,
            stats: stats,
            types: types,
            weight: weight
        )
    }
}
