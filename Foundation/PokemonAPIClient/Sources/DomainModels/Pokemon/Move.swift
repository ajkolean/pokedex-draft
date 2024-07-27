import Foundation

// Extensions to map API response models to domain models
extension Move {
    init(apiModel: MoveResponse) {
        let id = apiModel.id
        let name = MoveName(rawValue: apiModel.name)
        let accuracy = apiModel.accuracy
        let effectChance = apiModel.effect_chance
        let pp = apiModel.pp
        let priority = apiModel.priority
        let power = apiModel.power
        let contestCombos = apiModel.contest_combos.map { ContestComboSets(
            normal: ContestComboDetail(apiModel: $0.normal),
            super: ContestComboDetail(apiModel: $0.super)
        )}
        let contestType = apiModel.contest_type.map { ContestTypeName(rawValue: $0.name) }
        let contestEffect = apiModel.contest_effect?.url
        let damageClass = MoveDamageClassName(rawValue: apiModel.damage_class.name)
        let effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        let effectChanges = apiModel.effect_changes.map { Ability.EffectChange(apiModel: $0) }
        let generation = GenerationName(rawValue: apiModel.generation.name)
        let meta = apiModel.meta.map { MoveMeta(apiModel: $0) }
        let names = apiModel.names.map { Name(apiModel: $0) }
        let pastValues = apiModel.past_values.map { PastMoveStatValues(apiModel: $0) }
        let statChanges = apiModel.stat_changes.map { MoveStatChange(apiModel: $0) }
        let superContestEffect = apiModel.super_contest_effect?.url
        let target = MoveTargetName(rawValue: apiModel.target.name)
        let type = TypeName(rawValue: apiModel.type.name)
        let learnedByPokemon = apiModel.learned_by_pokemon.map { PokemonName(rawValue: $0.name) }
        let flavorTextEntries = apiModel.flavor_text_entries.map { MoveFlavorText(apiModel: $0) }
        
        self.init(id: id, name: name, accuracy: accuracy, effectChance: effectChance, pp: pp, priority: priority, power: power, contestCombos: contestCombos, contestType: contestType, contestEffect: contestEffect, damageClass: damageClass, effectEntries: effectEntries, effectChanges: effectChanges, generation: generation, meta: meta, names: names, pastValues: pastValues, statChanges: statChanges, superContestEffect: superContestEffect, target: target, type: type, learnedByPokemon: learnedByPokemon, flavorTextEntries: flavorTextEntries)
    }
}

extension Move.ContestComboDetail {
    init(apiModel: ContestComboDetailResponse) {
        let useBefore = apiModel.use_before?.map { MoveName(rawValue: $0.name) }
        let useAfter = apiModel.use_after?.map { MoveName(rawValue: $0.name) }
        
        self.init(useBefore: useBefore, useAfter: useAfter)
    }
}

extension Move.MoveFlavorText {
    init(apiModel: MoveFlavorTextResponse) {
        let flavorText = apiModel.flavor_text
        let language = LanguageName(rawValue: apiModel.language.name)
        let versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        
        self.init(flavorText: flavorText, language: language, versionGroup: versionGroup)
    }
}

extension Move.MoveMeta {
    init(apiModel: MoveMetaDataResponse) {
        let ailment = MoveAilmentName(rawValue: apiModel.ailment.name)
        let category = MoveCategoryName(rawValue: apiModel.category.name)
        let minHits = apiModel.min_hits
        let maxHits = apiModel.max_hits
        let minTurns = apiModel.min_turns
        let maxTurns = apiModel.max_turns
        let drain = apiModel.drain
        let healing = apiModel.healing
        let critRate = apiModel.crit_rate
        let ailmentChance = apiModel.ailment_chance
        let flinchChance = apiModel.flinch_chance
        let statChance = apiModel.stat_chance
        
        self.init(ailment: ailment, category: category, minHits: minHits, maxHits: maxHits, minTurns: minTurns, maxTurns: maxTurns, drain: drain, healing: healing, critRate: critRate, ailmentChance: ailmentChance, flinchChance: flinchChance, statChance: statChance)
    }
}

extension Move.MoveStatChange {
    init(apiModel: MoveStatChangeResponse) {
        let change = apiModel.change
        let stat = StatName(rawValue: apiModel.stat.name)
        
        self.init(change: change, stat: stat)
    }
}

extension Move.PastMoveStatValues {
    init(apiModel: PastMoveStatValuesResponse) {
        let accuracy = apiModel.accuracy
        let effectChance = apiModel.effect_chance
        let power = apiModel.power
        let pp = apiModel.pp
        let effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        let type = TypeName(rawValue: apiModel.type.name)
        let versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        
        self.init(accuracy: accuracy, effectChance: effectChance, power: power, pp: pp, effectEntries: effectEntries, type: type, versionGroup: versionGroup)
    }
}

extension Ability.VerboseEffect {
    init(apiModel: VerboseEffectResponse) {
        let effect = apiModel.effect
        let language = LanguageName(rawValue: apiModel.language.name)
        let shortEffect = apiModel.short_effect
        
        self.init(effect: effect, shortEffect: shortEffect, language: language)
    }
}

extension Ability.EffectChange {
    init(apiModel: AbilityEffectChangeResponse) {
        let versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        let effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        
        self.init(versionGroup: versionGroup, effectEntries: effectEntries)
    }
}

extension MoveAilment {
    init(apiModel: MoveAilmentResponse) {
        let id = apiModel.id
        let name = MoveAilmentName(rawValue: apiModel.name)
        let moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        let names = apiModel.names.map { Name(apiModel: $0) }
        
        self.init(id: id, name: name, moves: moves, names: names)
    }
}

extension MoveBattleStyle {
    init(apiModel: MoveBattleStyleResponse) {
        let id = apiModel.id
        let name = MoveBattleStyleName(rawValue: apiModel.name)
        let names = apiModel.names.map { Name(apiModel: $0) }
        
        self.init(id: id, name: name, names: names)
    }
}

extension MoveCategory {
    init(apiModel: MoveCategoryResponse) {
        let id = apiModel.id
        let name = MoveCategoryName(rawValue: apiModel.name)
        let moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        let descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        
        self.init(id: id, name: name, moves: moves, descriptions: descriptions)
    }
}

extension MoveDamageClass {
    init(apiModel: MoveDamageClassResponse) {
        let id = apiModel.id
        let name = MoveDamageClassName(rawValue: apiModel.name)
        let descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        let moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        let names = apiModel.names.map { Name(apiModel: $0) }
        
        self.init(id: id, name: name, descriptions: descriptions, moves: moves, names: names)
    }
}

extension MoveLearnMethod {
    init(apiModel: MoveLearnMethodResponse) {
        let id = apiModel.id
        let name = MoveLearnMethodName(rawValue: apiModel.name)
        let descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        let names = apiModel.names.map { Name(apiModel: $0) }
        let versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
        
        self.init(id: id, name: name, descriptions: descriptions, names: names, versionGroups: versionGroups)
    }
}

extension MoveTarget {
    init(apiModel: MoveTargetResponse) {
        let id = apiModel.id
        let name = MoveTargetName(rawValue: apiModel.name)
        let descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        let moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        let names = apiModel.names.map { Name(apiModel: $0) }
        
        self.init(id: id, name: name, descriptions: descriptions, moves: moves, names: names)
    }
}
