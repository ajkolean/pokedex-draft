import Foundation

struct LocationResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The region this location can be found in.
    let region: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of game indices relevant to this location by generation.
    let game_indices: [GenerationGameIndexResponse]
    /// Areas that can be found within this location.
    let areas: [NamedAPIResource]
}

struct LocationAreaResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The internal id of an API resource within game data.
    let game_index: Int
    /// A list of methods in which Pokémon may be encountered in this area and how likely the method will occur depending on the version of the game.
    let encounter_method_rates: [EncounterMethodRateResponse]
    /// The region this location area can be found in.
    let location: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon that can be encountered in this area along with version-specific details about the encounter.
    let pokemon_encounters: [PokemonEncounterResponse]
}

struct EncounterMethodRateResponse: Codable {
    /// The method in which Pokémon may be encountered in an area.
    let encounter_method: NamedAPIResource
    /// The chance of the encounter to occur on a version of the game.
    let version_details: [EncounterVersionDetailsResponse]
}

struct EncounterVersionDetailsResponse: Codable {
    /// The chance of an encounter to occur.
    let rate: Int
    /// The version of the game in which the encounter can occur with the given chance.
    let version: NamedAPIResource
}

struct PokemonEncounterResponse: Codable {
    /// The Pokémon being encountered.
    let pokemon: NamedAPIResource
    /// A list of versions and encounters with Pokémon that might happen in the referenced location area.
    let version_details: [VersionEncounterDetailResponse]
}

struct PalParkAreaResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon encountered in this pal park area along with details.
    let pokemon_encounters: [PalParkEncounterSpeciesResponse]
}

struct PalParkEncounterSpeciesResponse: Codable {
    /// The base score given to the player when this Pokémon is caught during a pal park run.
    let base_score: Int
    /// The base rate for encountering this Pokémon in this pal park area.
    let rate: Int
    /// The Pokémon species being encountered.
    let pokemon_species: NamedAPIResource
}

struct RegionResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// A list of locations that can be found in this region.
    let locations: [NamedAPIResource]
    /// The generation this region was introduced in.
    let main_generation: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokédexes that catalogue Pokémon in this region.
    let pokedexes: [NamedAPIResource]
    /// A list of version groups where this region can be visited.
    let version_groups: [NamedAPIResource]
}
