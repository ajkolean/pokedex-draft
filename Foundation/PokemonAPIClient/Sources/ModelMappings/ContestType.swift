import Foundation

extension ContestType {
    init(apiModel: ContestTypeResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let berryFlavor = BerryFlavorName(rawValue: apiModel.berry_flavor.name)
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }

        self.init(id: id, name: name, berryFlavor: berryFlavor, names: names)
    }
}

extension ContestEffect {
    init(apiModel: ContestEffectResponse) {
        let id = apiModel.id
        let appeal = apiModel.appeal
        let jam = apiModel.jam
        let effectEntries = apiModel.effect_entries.map { Effect(
            effect: $0.effect,
            language: LanguageName(rawValue: $0.language.name)
        ) }
        let flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(
            flavorText: $0.flavor_text,
            language: LanguageName(rawValue: $0.language.name)
        ) }

        self.init(id: id, appeal: appeal, jam: jam, effectEntries: effectEntries, flavorTextEntries: flavorTextEntries)
    }
}

extension SuperContestEffect {
    init(apiModel: SuperContestEffectResponse) {
        let id = apiModel.id
        let appeal = apiModel.appeal
        let flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(
            flavorText: $0.flavor_text,
            language: LanguageName(rawValue: $0.language.name)
        ) }

        self.init(id: id, appeal: appeal, flavorTextEntries: flavorTextEntries)
    }
}

extension EncounterMethod {
    init(apiModel: EncounterMethodResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let order = apiModel.order
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }

        self.init(id: id, name: name, order: order, names: names)
    }
}

extension EncounterCondition {
    init(apiModel: EncounterConditionResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        let values = apiModel.values.map { EncounterConditionValueName(rawValue: $0.name) }

        self.init(id: id, name: name, names: names, values: values)
    }
}

extension EncounterConditionValue {
    init(apiModel: EncounterConditionValueResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let condition = EncounterConditionName(rawValue: apiModel.condition.name)
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }

        self.init(id: id, name: name, condition: condition, names: names)
    }
}

extension EvolutionChain {
    init(apiModel: EvolutionChainResponse) {
        let id = apiModel.id
        let babyTriggerItem = apiModel.baby_trigger_item != nil ? ItemName(rawValue: apiModel.baby_trigger_item!.name) : nil
        let chain = ChainLink(apiModel: apiModel.chain)

        self.init(id: id, babyTriggerItem: babyTriggerItem, chain: chain)
    }
}

extension EvolutionChain.ChainLink {
    init(apiModel: ChainLinkResponse) {
        let isBaby = apiModel.is_baby
        let species = PokemonSpeciesName(rawValue: apiModel.species.name)
        let evolutionDetails = apiModel.evolution_details?.map { EvolutionDetail(apiModel: $0) }
        let evolvesTo = apiModel.evolves_to.map { EvolutionChain.ChainLink(apiModel: $0) }

        self.init(isBaby: isBaby, species: species, evolutionDetails: evolutionDetails, evolvesTo: evolvesTo)
    }
}

extension EvolutionChain.ChainLink.EvolutionDetail {
    init(apiModel: EvolutionDetailResponse) {
        let item = apiModel.item != nil ? ItemName(rawValue: apiModel.item!.name) : nil
        let trigger = EvolutionTriggerName(rawValue: apiModel.trigger.name)
        let gender = apiModel.gender
        let heldItem = apiModel.held_item != nil ? ItemName(rawValue: apiModel.held_item!.name) : nil
        let knownMove = apiModel.known_move != nil ? MoveName(rawValue: apiModel.known_move!.name) : nil
        let knownMoveType = apiModel.known_move_type != nil ? TypeName(rawValue: apiModel.known_move_type!.name) : nil
        let location = apiModel.location != nil ? LocationName(rawValue: apiModel.location!.name) : nil
        let minLevel = apiModel.min_level
        let minHappiness = apiModel.min_happiness
        let minBeauty = apiModel.min_beauty
        let minAffection = apiModel.min_affection
        let needsOverworldRain = apiModel.needs_overworld_rain
        let partySpecies = apiModel.party_species != nil ? PokemonSpeciesName(rawValue: apiModel.party_species!.name) : nil
        let partyType = apiModel.party_type != nil ? TypeName(rawValue: apiModel.party_type!.name) : nil
        let relativePhysicalStats = apiModel.relative_physical_stats
        let timeOfDay = apiModel.time_of_day
        let tradeSpecies = apiModel.trade_species != nil ? PokemonSpeciesName(rawValue: apiModel.trade_species!.name) : nil
        let turnUpsideDown = apiModel.turn_upside_down

        self.init(
            item: item,
            trigger: trigger,
            gender: gender,
            heldItem: heldItem,
            knownMove: knownMove,
            knownMoveType: knownMoveType,
            location: location,
            minLevel: minLevel,
            minHappiness: minHappiness,
            minBeauty: minBeauty,
            minAffection: minAffection,
            needsOverworldRain: needsOverworldRain,
            partySpecies: partySpecies,
            partyType: partyType,
            relativePhysicalStats: relativePhysicalStats,
            timeOfDay: timeOfDay,
            tradeSpecies: tradeSpecies,
            turnUpsideDown: turnUpsideDown
        )
    }
}

extension EvolutionTrigger {
    init(apiModel: EvolutionTriggerResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(id: id, name: name, names: names, pokemonSpecies: pokemonSpecies)
    }
}
