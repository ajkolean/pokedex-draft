import Foundation

// Common Models
struct APIResource: Codable {
    /// The URL of the referenced resource.
    let url: String
}

struct DescriptionResponse: Codable {
    /// The localized description for an API resource in a specific language.
    let description: String
    /// The language this description is in.
    let language: NamedAPIResource
}

struct EffectResponse: Codable {
    /// The localized effect text for an API resource in a specific language.
    let effect: String
    /// The language this effect is in.
    let language: NamedAPIResource
}

struct EncounterResponse: Codable {
    /// The lowest level the Pokémon could be encountered at.
    let min_level: Int
    /// The highest level the Pokémon could be encountered at.
    let max_level: Int
    /// A list of condition values that must be in effect for this encounter to occur.
    let condition_values: [NamedAPIResource]
    /// Percent chance that this encounter will occur.
    let chance: Int
    /// The method by which this encounter happens.
    let method: NamedAPIResource
}

struct FlavorTextResponse: Codable {
    /// The localized flavor text for an API resource in a specific language. Note that this text is left unprocessed as it is found in game files. This means that it contains special characters that one might want to replace with their visible decodable version.
    let flavor_text: String
    /// The language this flavor text is in.
    let language: NamedAPIResource
    /// The game version this flavor text is extracted from.
    let version: NamedAPIResource
}

struct GenerationGameIndexResponse: Codable {
    /// The internal id of an API resource within game data.
    let game_index: Int
    /// The generation relevant to this game index.
    let generation: NamedAPIResource
}

struct MachineVersionDetailResponse: Codable {
    /// The machine that teaches a move from an item.
    let machine: APIResource
    /// The version group of this specific machine.
    let version_group: NamedAPIResource
}

struct NameResponse: Codable {
    /// The localized name for an API resource in a specific language.
    let name: String
    /// The language this name is in.
    let language: NamedAPIResource
}

struct NamedAPIResource: Codable {
    /// The name of the referenced resource.
    let name: String
    /// The URL of the referenced resource.
    let url: String
}

struct VerboseEffectResponse: Codable {
    /// The localized effect text for an API resource in a specific language.
    let effect: String
    /// The localized effect text in brief.
    let short_effect: String
    /// The language this effect is in.
    let language: NamedAPIResource
}

struct VersionEncounterDetailResponse: Codable {
    /// The game version this encounter happens in.
    let version: NamedAPIResource
    /// The total percentage of all encounter potential.
    let max_chance: Int
    /// A list of encounters and their specifics.
    let encounter_details: [EncounterResponse]
}

struct VersionGameIndexResponse: Codable {
    /// The internal id of an API resource within game data.
    let game_index: Int
    /// The version relevant to this game index.
    let version: NamedAPIResource
}

struct VersionGroupFlavorTextResponse: Codable {
    /// The localized name for an API resource in a specific language.
    let text: String
    /// The language this name is in.
    let language: NamedAPIResource
    /// The version group which uses this flavor text.
    let version_group: NamedAPIResource
}

// Utility Models
struct LanguageResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// Whether or not the games are published in this language.
    let official: Bool
    /// The two-letter code of the country where this language is spoken. Note that it is not unique.
    let iso639: String
    /// The two-letter code of the language. Note that it is not unique.
    let iso3166: String
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}
