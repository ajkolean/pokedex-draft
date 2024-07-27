import Foundation

// Domain model for Generation
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

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for PokemonEntry
public struct PokemonEntry: Codable, Hashable {
    public let entryNumber: Int
    public let pokemonSpecies: PokemonSpeciesName
}

// Domain model for Pokedex
public struct Pokedex: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokedexName
    public let isMainSeries: Bool
    public let descriptions: [Description]
    public let names: [Name]
    public let pokemonEntries: [PokemonEntry]
    public let region: RegionName
    public let versionGroups: [VersionGroupName]

    public struct Description: Codable, Hashable {
        public let description: String
        public let language: LanguageName
    }

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for Version
public struct Version: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: VersionName
    public let names: [Name]
    public let versionGroup: VersionGroupName

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for VersionGroup
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

extension Generation {
    init(apiModel: GenerationResponse) {
        id = apiModel.id
        name = apiModel.name
        abilities = apiModel.abilities.map { AbilityName(rawValue: $0.name) }
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        mainRegion = RegionName(rawValue: apiModel.main_region.name)
        moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
        types = apiModel.types.map { TypeName(rawValue: $0.name) }
        versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
    }
}

extension PokemonEntry {
    init(apiModel: PokemonEntryResponse) {
        entryNumber = apiModel.entry_number
        pokemonSpecies = PokemonSpeciesName(rawValue: apiModel.pokemon_species.name)
    }
}

extension Pokedex {
    init(apiModel: PokedexResponse) {
        id = apiModel.id
        name = apiModel.name
        isMainSeries = apiModel.is_main_series
        descriptions = apiModel.descriptions.map { Description(
            description: $0.description,
            language: LanguageName(rawValue: $0.language.name)
        ) }
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        pokemonEntries = apiModel.pokemon_entries.map { PokemonEntry(apiModel: $0) }
        region = RegionName(rawValue: apiModel.region.name)
        versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
    }
}

extension Version {
    init(apiModel: VersionResponse) {
        id = apiModel.id
        name = apiModel.name
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}

extension VersionGroup {
    init(apiModel: VersionGroupResponse) {
        id = apiModel.id
        name = apiModel.name
        order = apiModel.order
        generation = GenerationName(rawValue: apiModel.generation.name)
        moveLearnMethods = apiModel.move_learn_methods.map { MoveLearnMethodName(rawValue: $0.name) }
        pokedexes = apiModel.pokedexes.map { PokedexName(rawValue: $0.name) }
        regions = apiModel.regions.map { RegionName(rawValue: $0.name) }
        versions = apiModel.versions.map { VersionName(rawValue: $0.name) }
    }
}
