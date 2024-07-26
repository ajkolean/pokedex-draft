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
        self.id = apiModel.id
        self.name = apiModel.name
        self.abilities = apiModel.abilities.map { AbilityName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.mainRegion = RegionName(rawValue: apiModel.main_region.name)
        self.moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
        self.types = apiModel.types.map { TypeName(rawValue: $0.name) }
        self.versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
    }
}

extension PokemonEntry {
    init(apiModel: PokemonEntryResponse) {
        self.entryNumber = apiModel.entry_number
        self.pokemonSpecies = PokemonSpeciesName(rawValue: apiModel.pokemon_species.name)
    }
}

extension Pokedex {
    init(apiModel: PokedexResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.isMainSeries = apiModel.is_main_series
        self.descriptions = apiModel.descriptions.map { Description(description: $0.description, language: LanguageName(rawValue: $0.language.name)) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemonEntries = apiModel.pokemon_entries.map { PokemonEntry(apiModel: $0) }
        self.region = RegionName(rawValue: apiModel.region.name)
        self.versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
    }
}

extension Version {
    init(apiModel: VersionResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}

extension VersionGroup {
    init(apiModel: VersionGroupResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.order = apiModel.order
        self.generation = GenerationName(rawValue: apiModel.generation.name)
        self.moveLearnMethods = apiModel.move_learn_methods.map { MoveLearnMethodName(rawValue: $0.name) }
        self.pokedexes = apiModel.pokedexes.map { PokedexName(rawValue: $0.name) }
        self.regions = apiModel.regions.map { RegionName(rawValue: $0.name) }
        self.versions = apiModel.versions.map { VersionName(rawValue: $0.name) }
    }
}
