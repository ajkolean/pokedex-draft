import Foundation

struct GenerationResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// A list of abilities that were introduced in this generation.
    let abilities: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// The main region traveled in this generation.
    let main_region: NamedAPIResource
    /// A list of moves that were introduced in this generation.
    let moves: [NamedAPIResource]
    /// A list of Pokémon species that were introduced in this generation.
    let pokemon_species: [NamedAPIResource]
    /// A list of types that were introduced in this generation.
    let types: [NamedAPIResource]
    /// A list of version groups that were introduced in this generation.
    let version_groups: [NamedAPIResource]
}

struct PokemonEntryResponse: Codable {
    /// The index of this Pokémon species entry within the Pokédex.
    let entry_number: Int
    /// The Pokémon species being encountered.
    let pokemon_species: NamedAPIResource
}

struct PokedexResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// Whether or not this Pokédex originated in the main series of the video games.
    let is_main_series: Bool
    /// The description of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon catalogued in this Pokédex and their indexes.
    let pokemon_entries: [PokemonEntryResponse]
    /// The region this Pokédex catalogues Pokémon for.
    let region: NamedAPIResource
    /// A list of version groups this Pokédex is relevant to.
    let version_groups: [NamedAPIResource]
}

struct VersionResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// The version group this version belongs to.
    let version_group: NamedAPIResource
}

struct VersionGroupResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// Order for sorting. Almost by date of release, except similar versions are grouped together.
    let order: Int
    /// The generation this version was introduced in.
    let generation: NamedAPIResource
    /// A list of methods in which Pokémon can learn moves in this version group.
    let move_learn_methods: [NamedAPIResource]
    /// A list of Pokédexes introduced in this version group.
    let pokedexes: [NamedAPIResource]
    /// A list of regions that can be visited in this version group.
    let regions: [NamedAPIResource]
    /// The versions this version group owns.
    let versions: [NamedAPIResource]
}
