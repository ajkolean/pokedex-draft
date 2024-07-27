import Foundation
import MemberwiseInit

// Domain model for Location
@MemberwiseInit(.public)
public struct Location: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: LocationName
    public let region: RegionName
    public let names: [Name]
    public let gameIndices: [GenerationGameIndex]
    public let areas: [LocationAreaName]
    
    @MemberwiseInit(.public)
    public struct GenerationGameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let generation: GenerationName
    }
}

// Domain model for LocationArea
@MemberwiseInit(.public)
public struct LocationArea: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: LocationAreaName
    public let gameIndex: Int
    public let encounterMethodRates: [EncounterMethodRate]
    public let location: LocationName
    public let names: [Name]
    public let pokemonEncounters: [PokemonEncounter]
    
    @MemberwiseInit(.public)
    public struct EncounterMethodRate: Codable, Hashable {
        public let encounterMethod: EncounterMethodName
        public let versionDetails: [VersionDetail]
        
        @MemberwiseInit(.public)
        public struct VersionDetail: Codable, Hashable {
            public let rate: Int
            public let version: VersionName
        }
    }
    
    @MemberwiseInit(.public)
    public struct PokemonEncounter: Codable, Hashable {
        public let pokemon: PokemonName
        public let versionDetails: [VersionDetail]
        
        @MemberwiseInit(.public)
        public struct VersionDetail: Codable, Hashable {
            public let version: VersionName
            public let maxChance: Int
            public let encounterDetails: [EncounterDetail]
            
            @MemberwiseInit(.public)
            public struct EncounterDetail: Codable, Hashable {
                public let minLevel: Int
                public let maxLevel: Int
                public let conditionValues: [EncounterConditionValueName]
                public let chance: Int
                public let method: EncounterMethodName
            }
        }
    }
}

// Domain model for PalParkArea
@MemberwiseInit(.public)
public struct PalParkArea: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PalParkAreaName
    public let names: [Name]
    public let pokemonEncounters: [EncounterSpecies]
    
    @MemberwiseInit(.public)
    public struct EncounterSpecies: Codable, Hashable {
        public let baseScore: Int
        public let rate: Int
        public let pokemonSpecies: PokemonSpeciesName
    }
}

// Domain model for Region
@MemberwiseInit(.public)
public struct Region: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: RegionName
    public let locations: [LocationName]
    public let mainGeneration: GenerationName
    public let names: [Name]
    public let pokedexes: [PokedexName]
    public let versionGroups: [VersionGroupName]
}
