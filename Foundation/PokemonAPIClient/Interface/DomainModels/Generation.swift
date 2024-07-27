import Foundation
import MemberwiseInit

// Domain model for Generation
@MemberwiseInit(.public)
public struct Generation: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: GenerationName
    public let abilities: [AbilityName]
    public let names: [Name]
    public let mainRegion: RegionName
    public let moves: [MoveName]
    public let pokemonSpecies: [PokemonSpeciesName]
    public let types: [TypeName]
    public let versionGroups: [VersionGroupName]
}

// Domain model for PokemonEntry
@MemberwiseInit(.public)
public struct PokemonEntry: Codable, Hashable {
    public let entryNumber: Int
    public let pokemonSpecies: PokemonSpeciesName
}

// Domain model for Pokedex
@MemberwiseInit(.public)
public struct Pokedex: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokedexName
    public let isMainSeries: Bool
    public let descriptions: [Description]
    public let names: [Name]
    public let pokemonEntries: [PokemonEntry]
    public let region: RegionName
    public let versionGroups: [VersionGroupName]
}

// Domain model for Version
@MemberwiseInit(.public)
public struct Version: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: VersionName
    public let names: [Name]
    public let versionGroup: VersionGroupName
}

// Domain model for VersionGroup
@MemberwiseInit(.public)
public struct VersionGroup: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: VersionGroupName
    public let order: Int
    public let generation: GenerationName
    public let moveLearnMethods: [MoveLearnMethodName]
    public let pokedexes: [PokedexName]
    public let regions: [RegionName]
    public let versions: [VersionName]
}
