import Foundation
import MemberwiseInit

// Domain model for ContestType
@MemberwiseInit(.public)
public struct ContestType: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ContestTypeName
    public let berryFlavor: BerryFlavorName
    public let names: [Name]
}

// Domain model for ContestEffect
@MemberwiseInit(.public)
public struct ContestEffect: Codable, Hashable, Identifiable {
    public let id: ContestEffectID
    public let appeal: Int
    public let jam: Int
    public let effectEntries: [Effect]
    public let flavorTextEntries: [FlavorText]
    
    @MemberwiseInit(.public)
    public struct Effect: Codable, Hashable {
        public let effect: String
        public let language: LanguageName
    }
    
    @MemberwiseInit(.public)
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
    }
}

// Domain model for SuperContestEffect
@MemberwiseInit(.public)
public struct SuperContestEffect: Codable, Hashable, Identifiable {
    public let id: SuperContestEffectID
    public let appeal: Int
    public let flavorTextEntries: [FlavorText]
    
    @MemberwiseInit(.public)
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
    }
}

// Domain model for EncounterMethod
@MemberwiseInit(.public)
public struct EncounterMethod: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EncounterMethodName
    public let order: Int
    public let names: [Name]
}

// Domain model for EncounterCondition
@MemberwiseInit(.public)
public struct EncounterCondition: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EncounterConditionName
    public let names: [Name]
    public let values: [EncounterConditionValueName]
}

// Domain model for EncounterConditionValue
@MemberwiseInit(.public)
public struct EncounterConditionValue: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EncounterConditionValueName
    public let condition: EncounterConditionName
    public let names: [Name]
}

// Domain model for EvolutionChain
@MemberwiseInit(.public)
public struct EvolutionChain: Codable, Hashable, Identifiable {
    public let id: Int
    public let babyTriggerItem: ItemName?
    public let chain: ChainLink
    
    @MemberwiseInit(.public)
    public struct ChainLink: Codable, Hashable {
        public let isBaby: Bool
        public let species: PokemonSpeciesName
        public let evolutionDetails: [EvolutionDetail]?
        public let evolvesTo: [ChainLink]
        
        @MemberwiseInit(.public)
        public struct EvolutionDetail: Codable, Hashable {
            public let item: ItemName?
            public let trigger: EvolutionTriggerName
            public let gender: Int?
            public let heldItem: ItemName?
            public let knownMove: MoveName?
            public let knownMoveType: TypeName?
            public let location: LocationName?
            public let minLevel: Int?
            public let minHappiness: Int?
            public let minBeauty: Int?
            public let minAffection: Int?
            public let needsOverworldRain: Bool
            public let partySpecies: PokemonSpeciesName?
            public let partyType: TypeName?
            public let relativePhysicalStats: Int?
            public let timeOfDay: String
            public let tradeSpecies: PokemonSpeciesName?
            public let turnUpsideDown: Bool
        }
    }
}

// Domain model for EvolutionTrigger
@MemberwiseInit(.public)
public struct EvolutionTrigger: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EvolutionTriggerName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
}
