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
        id = apiModel.id
        name = apiModel.name
        berryFlavor = BerryFlavorName(rawValue: apiModel.berry_flavor.name)
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension ContestEffect {
    init(apiModel: ContestEffectResponse) {
        id = apiModel.id
        appeal = apiModel.appeal
        jam = apiModel.jam
        effectEntries = apiModel.effect_entries
            .map { Effect(effect: $0.effect, language: LanguageName(rawValue: $0.language.name)) }
        flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(
            flavorText: $0.flavor_text,
            language: LanguageName(rawValue: $0.language.name)
        ) }
    }
}

extension SuperContestEffect {
    init(apiModel: SuperContestEffectResponse) {
        id = apiModel.id
        appeal = apiModel.appeal
        flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(
            flavorText: $0.flavor_text,
            language: LanguageName(rawValue: $0.language.name)
        ) }
    }
}

extension EncounterMethod {
    init(apiModel: EncounterMethodResponse) {
        id = apiModel.id
        name = apiModel.name
        order = apiModel.order
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension EncounterCondition {
    init(apiModel: EncounterConditionResponse) {
        id = apiModel.id
        name = apiModel.name
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        values = apiModel.values.map { EncounterConditionValueName(rawValue: $0.name) }
    }
}

extension EncounterConditionValue {
    init(apiModel: EncounterConditionValueResponse) {
        id = apiModel.id
        name = apiModel.name
        condition = EncounterConditionName(rawValue: apiModel.condition.name)
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension EvolutionChain {
    init(apiModel: EvolutionChainResponse) {
        id = apiModel.id
        babyTriggerItem = apiModel.baby_trigger_item != nil ? ItemName(rawValue: apiModel.baby_trigger_item!.name) : nil
        chain = ChainLink(apiModel: apiModel.chain)
    }
}

extension EvolutionChain.ChainLink {
    init(apiModel: ChainLinkResponse) {
        isBaby = apiModel.is_baby
        species = PokemonSpeciesName(rawValue: apiModel.species.name)
        evolutionDetails = apiModel.evolution_details?.map { EvolutionDetail(apiModel: $0) }
        evolvesTo = apiModel.evolves_to.map { EvolutionChain.ChainLink(apiModel: $0) }
    }
}

extension EvolutionChain.ChainLink.EvolutionDetail {
    init(apiModel: EvolutionDetailResponse) {
        item = apiModel.item != nil ? ItemName(rawValue: apiModel.item!.name) : nil
        trigger = EvolutionTriggerName(rawValue: apiModel.trigger.name)
        gender = apiModel.gender
        heldItem = apiModel.held_item != nil ? ItemName(rawValue: apiModel.held_item!.name) : nil
        knownMove = apiModel.known_move != nil ? MoveName(rawValue: apiModel.known_move!.name) : nil
        knownMoveType = apiModel.known_move_type != nil ? TypeName(rawValue: apiModel.known_move_type!.name) : nil
        location = apiModel.location != nil ? LocationName(rawValue: apiModel.location!.name) : nil
        minLevel = apiModel.min_level
        minHappiness = apiModel.min_happiness
        minBeauty = apiModel.min_beauty
        minAffection = apiModel.min_affection
        needsOverworldRain = apiModel.needs_overworld_rain
        partySpecies = apiModel.party_species != nil ? PokemonSpeciesName(rawValue: apiModel.party_species!.name) : nil
        partyType = apiModel.party_type != nil ? TypeName(rawValue: apiModel.party_type!.name) : nil
        relativePhysicalStats = apiModel.relative_physical_stats
        timeOfDay = apiModel.time_of_day
        tradeSpecies = apiModel.trade_species != nil ? PokemonSpeciesName(rawValue: apiModel.trade_species!.name) : nil
        turnUpsideDown = apiModel.turn_upside_down
    }
}

extension EvolutionTrigger {
    init(apiModel: EvolutionTriggerResponse) {
        id = apiModel.id
        name = apiModel.name
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}
