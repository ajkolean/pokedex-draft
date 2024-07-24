import Foundation
import SwiftData

public struct PokemonSpecies: Codable, Hashable, Sendable {
    public let name: String

    //    public let baseHappiness: Int
    //    public let captureRate: Int
    //    public let color: NamedAPIResource
    //    public let eggGroups: [NamedAPIResource]
    //    public let evolutionChain: APIResource
    //    public let evolvesFromSpecies: NamedAPIResource?
    public let flavorTextEntries: [FlavorTextEntry]
    //    public let formDescriptions: [String]
    //    public let formsSwitchable: Bool
    //    public let genderRate: Int
    //    public let genera: [Genus]
    //    public let generation: NamedAPIResource
    //    public let growthRate: NamedAPIResource
    //    public let habitat: NamedAPIResource
    //    public let hasGenderDifferences: Bool
    //    public let hatchCounter: Int
    //    public let id: Int
    //    public let isBaby: Bool
    //    public let isLegendary: Bool
    //    public let isMythical: Bool
    //    public let names: [Name]
    //    public let order: Int
    //    public let palParkEncounters: [PalParkEncounter]
    //    public let pokedexNumbers: [PokedexNumber]
    //    public let shape: NamedAPIResource
    //    public let varieties: [Variety]

    enum CodingKeys: String, CodingKey {
        //        case baseHappiness = "base_happiness"
        //        case captureRate = "capture_rate"
        //        case color
        //        case eggGroups = "egg_groups"
        //        case evolutionChain = "evolution_chain"
        //        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        //        case formDescriptions = "form_descriptions"
        //        case formsSwitchable = "forms_switchable"
        //        case genderRate = "gender_rate"
        //        case genera
        //        case generation
        //        case growthRate = "growth_rate"
        //        case habitat
        //        case hasGenderDifferences = "has_gender_differences"
        //        case hatchCounter = "hatch_counter"
        //        case id
        //        case isBaby = "is_baby"
        //        case isLegendary = "is_legendary"
        //        case isMythical = "is_mythical"
        case name
        //        case names
        //        case order
        //        case palParkEncounters = "pal_park_encounters"
        //        case pokedexNumbers = "pokedex_numbers"
        //        case shape
        //        case varieties
    }

    public var asEntity: PokemonSpeciesEntity {
        .init(name: name, flavorTextEntries: flavorTextEntries)
    }
}

public struct NamedAPIResource: Codable, Hashable, Sendable {
    public let name: String
    public let url: String

    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

public struct APIResource: Codable, Hashable, Sendable {
    public let url: String

    public init(url: String) {
        self.url = url
    }
}

public struct FlavorTextEntry: Codable, Hashable, Sendable {
    public let flavorText: String
    public let language: NamedAPIResource
    public let version: NamedAPIResource

    public init(flavorText: String, language: NamedAPIResource, version: NamedAPIResource) {
        self.flavorText = flavorText
        self.language = language
        self.version = version
    }

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
}

public struct Genus: Codable, Hashable, Sendable {
    public let genus: String
    public let language: NamedAPIResource

    public init(genus: String, language: NamedAPIResource) {
        self.genus = genus
        self.language = language
    }
}

public struct Name: Codable, Hashable, Sendable {
    public let language: NamedAPIResource
    public let name: String

    public init(language: NamedAPIResource, name: String) {
        self.language = language
        self.name = name
    }
}

public struct PalParkEncounter: Codable, Hashable, Sendable {
    public let area: NamedAPIResource
    public let baseScore: Int
    public let rate: Int

    public init(area: NamedAPIResource, baseScore: Int, rate: Int) {
        self.area = area
        self.baseScore = baseScore
        self.rate = rate
    }

    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
}

public struct PokedexNumber: Codable, Hashable, Sendable {
    public let entryNumber: Int
    public let pokedex: NamedAPIResource

    public init(entryNumber: Int, pokedex: NamedAPIResource) {
        self.entryNumber = entryNumber
        self.pokedex = pokedex
    }

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

public struct Variety: Codable, Hashable, Sendable {
    public let isDefault: Bool
    public let pokemon: NamedAPIResource

    public init(isDefault: Bool, pokemon: NamedAPIResource) {
        self.isDefault = isDefault
        self.pokemon = pokemon
    }

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}
