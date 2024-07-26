import Foundation

// Domain model for ContestType
public struct ContestType: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ContestTypeName
    public let berryFlavor: BerryFlavorName
    public let names: [Name]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for ContestEffect
public struct ContestEffect: Codable, Hashable, Identifiable {
    public let id: ContestEffectID
    public let appeal: Int
    public let jam: Int
    public let effectEntries: [Effect]
    public let flavorTextEntries: [FlavorText]
    
    public struct Effect: Codable, Hashable {
        public let effect: String
        public let language: LanguageName
    }
    
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
    }
}

// Domain model for SuperContestEffect
public struct SuperContestEffect: Codable, Hashable, Identifiable {
    public let id: SuperContestEffectID
    public let appeal: Int
    public let flavorTextEntries: [FlavorText]
    
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
    }
}

// Domain model for EncounterMethod
public struct EncounterMethod: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EncounterMethodName
    public let order: Int
    public let names: [Name]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for EncounterCondition
public struct EncounterCondition: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EncounterConditionName
    public let names: [Name]
    public let values: [EncounterConditionValueName]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for EncounterConditionValue
public struct EncounterConditionValue: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EncounterConditionValueName
    public let condition: EncounterConditionName
    public let names: [Name]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for EvolutionChain
public struct EvolutionChain: Codable, Hashable, Identifiable {
    public let id: Int
    public let babyTriggerItem: ItemName?
    public let chain: ChainLink
    
    public struct ChainLink: Codable, Hashable {
        public let isBaby: Bool
        public let species: PokemonSpeciesName
        public let evolutionDetails: [EvolutionDetail]?
        public let evolvesTo: [ChainLink]
        
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
public struct EvolutionTrigger: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EvolutionTriggerName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension ContestType {
    init(apiModel: ContestTypeResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.berryFlavor = BerryFlavorName(rawValue: apiModel.berry_flavor.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension ContestEffect {
    init(apiModel: ContestEffectResponse) {
        self.id = apiModel.id
        self.appeal = apiModel.appeal
        self.jam = apiModel.jam
        self.effectEntries = apiModel.effect_entries.map { Effect(effect: $0.effect, language: LanguageName(rawValue: $0.language.name)) }
        self.flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(flavorText: $0.flavor_text, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension SuperContestEffect {
    init(apiModel: SuperContestEffectResponse) {
        self.id = apiModel.id
        self.appeal = apiModel.appeal
        self.flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(flavorText: $0.flavor_text, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension EncounterMethod {
    init(apiModel: EncounterMethodResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.order = apiModel.order
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension EncounterCondition {
    init(apiModel: EncounterConditionResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.values = apiModel.values.map { EncounterConditionValueName(rawValue: $0.name) }
    }
}

extension EncounterConditionValue {
    init(apiModel: EncounterConditionValueResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.condition = EncounterConditionName(rawValue: apiModel.condition.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension EvolutionChain {
    init(apiModel: EvolutionChainResponse) {
        self.id = apiModel.id
        self.babyTriggerItem = apiModel.baby_trigger_item != nil ? ItemName(rawValue: apiModel.baby_trigger_item!.name) : nil
        self.chain = ChainLink(apiModel: apiModel.chain)
    }
}

extension EvolutionChain.ChainLink {
    init(apiModel: ChainLinkResponse) {
        self.isBaby = apiModel.is_baby
        self.species = PokemonSpeciesName(rawValue: apiModel.species.name)
        self.evolutionDetails = apiModel.evolution_details?.map { EvolutionDetail(apiModel: $0) }
        self.evolvesTo = apiModel.evolves_to.map { EvolutionChain.ChainLink(apiModel: $0) }
    }
}

extension EvolutionChain.ChainLink.EvolutionDetail {
    init(apiModel: EvolutionDetailResponse) {
        self.item = apiModel.item != nil ? ItemName(rawValue: apiModel.item!.name) : nil
        self.trigger = EvolutionTriggerName(rawValue: apiModel.trigger.name)
        self.gender = apiModel.gender
        self.heldItem = apiModel.held_item != nil ? ItemName(rawValue: apiModel.held_item!.name) : nil
        self.knownMove = apiModel.known_move != nil ? MoveName(rawValue: apiModel.known_move!.name) : nil
        self.knownMoveType = apiModel.known_move_type != nil ? TypeName(rawValue: apiModel.known_move_type!.name) : nil
        self.location = apiModel.location != nil ? LocationName(rawValue: apiModel.location!.name) : nil
        self.minLevel = apiModel.min_level
        self.minHappiness = apiModel.min_happiness
        self.minBeauty = apiModel.min_beauty
        self.minAffection = apiModel.min_affection
        self.needsOverworldRain = apiModel.needs_overworld_rain
        self.partySpecies = apiModel.party_species != nil ? PokemonSpeciesName(rawValue: apiModel.party_species!.name) : nil
        self.partyType = apiModel.party_type != nil ? TypeName(rawValue: apiModel.party_type!.name) : nil
        self.relativePhysicalStats = apiModel.relative_physical_stats
        self.timeOfDay = apiModel.time_of_day
        self.tradeSpecies = apiModel.trade_species != nil ? PokemonSpeciesName(rawValue: apiModel.trade_species!.name) : nil
        self.turnUpsideDown = apiModel.turn_upside_down
    }
}

extension EvolutionTrigger {
    init(apiModel: EvolutionTriggerResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}


