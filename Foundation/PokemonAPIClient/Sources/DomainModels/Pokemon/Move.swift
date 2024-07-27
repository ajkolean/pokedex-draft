import Foundation

// Domain model for Move
public struct Move: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveName
    public let accuracy: Int?
    public let effectChance: Int?
    public let pp: Int
    public let priority: Int
    public let power: Int?
    public let contestCombos: ContestComboSets?
    public let contestType: ContestTypeName?
    public let contestEffect: URL?
    public let damageClass: MoveDamageClassName
    public let effectEntries: [Ability.VerboseEffect]
    public let effectChanges: [Ability.EffectChange]
    public let generation: GenerationName
    public let meta: MoveMeta?
    public let names: [Name]
    public let pastValues: [PastMoveStatValues]
    public let statChanges: [MoveStatChange]
    public let superContestEffect: URL?
    public let target: MoveTargetName
    public let type: TypeName
    public let learnedByPokemon: [PokemonName]
    public let flavorTextEntries: [MoveFlavorText]

    public struct ContestComboSets: Codable, Hashable {
        public let normal: ContestComboDetail
        public let `super`: ContestComboDetail
    }

    public struct ContestComboDetail: Codable, Hashable {
        public let useBefore: [MoveName]?
        public let useAfter: [MoveName]?
    }

    public struct MoveFlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
        public let versionGroup: VersionGroupName
    }

    public struct MoveMeta: Codable, Hashable {
        public let ailment: MoveAilmentName
        public let category: MoveCategoryName
        public let minHits: Int?
        public let maxHits: Int?
        public let minTurns: Int?
        public let maxTurns: Int?
        public let drain: Int
        public let healing: Int
        public let critRate: Int
        public let ailmentChance: Int
        public let flinchChance: Int
        public let statChance: Int
    }

    public struct MoveStatChange: Codable, Hashable {
        public let change: Int
        public let stat: StatName
    }

    public struct PastMoveStatValues: Codable, Hashable {
        public let accuracy: Int?
        public let effectChance: Int?
        public let power: Int?
        public let pp: Int?
        public let effectEntries: [Ability.VerboseEffect]
        public let type: TypeName
        public let versionGroup: VersionGroupName
    }
}

// Domain model for MoveAilment
public struct MoveAilment: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveAilmentName
    public let moves: [MoveName]
    public let names: [Name]
}

// Domain model for MoveBattleStyle
public struct MoveBattleStyle: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveBattleStyleName
    public let names: [Name]
}

// Domain model for MoveCategory
public struct MoveCategory: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveCategoryName
    public let moves: [MoveName]
    public let descriptions: [Description]
}

// Domain model for MoveDamageClass
public struct MoveDamageClass: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveDamageClassName
    public let descriptions: [Description]
    public let moves: [MoveName]
    public let names: [Name]
}

// Domain model for MoveLearnMethod
public struct MoveLearnMethod: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveLearnMethodName
    public let descriptions: [Description]
    public let names: [Name]
    public let versionGroups: [VersionGroupName]
}

// Domain model for MoveTarget
public struct MoveTarget: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveTargetName
    public let descriptions: [Description]
    public let moves: [MoveName]
    public let names: [Name]
}

public struct Name: Codable, Hashable {
    public let name: String
    public let language: LanguageName
}

public struct Description: Codable, Hashable {
    public let description: String
    public let language: LanguageName
}

extension Name {
    init(apiModel: NameResponse) {
        name = apiModel.name
        language = LanguageName(rawValue: apiModel.language.name)
    }
}

extension Description {
    init(apiModel: DescriptionResponse) {
        description = apiModel.description
        language = LanguageName(rawValue: apiModel.language.name)
    }
}

// Extensions to map API response models to domain models
extension Move {
    init(apiModel: MoveResponse) {
        id = apiModel.id
        name = MoveName(rawValue: apiModel.name)
        accuracy = apiModel.accuracy
        effectChance = apiModel.effect_chance
        pp = apiModel.pp
        priority = apiModel.priority
        power = apiModel.power
        contestCombos = apiModel.contest_combos.map { ContestComboSets(
            normal: ContestComboDetail(
                useBefore: $0.normal.use_before?.map { MoveName(rawValue: $0.name) },
                useAfter: $0.normal.use_after?.map { MoveName(rawValue: $0.name) }
            ),
            super: ContestComboDetail(
                useBefore: $0.super.use_before?.map { MoveName(rawValue: $0.name) },
                useAfter: $0.super.use_after?.map { MoveName(rawValue: $0.name) }
            )
        ) }
        contestType = apiModel.contest_type.map { ContestTypeName(rawValue: $0.name) }
        contestEffect = apiModel.contest_effect?.url
        damageClass = MoveDamageClassName(rawValue: apiModel.damage_class.name)
        effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        effectChanges = apiModel.effect_changes.map { Ability.EffectChange(apiModel: $0) }
        generation = GenerationName(rawValue: apiModel.generation.name)
        meta = apiModel.meta.map { MoveMeta(apiModel: $0) }
        names = apiModel.names.map { Name(apiModel: $0) }
        pastValues = apiModel.past_values.map { PastMoveStatValues(apiModel: $0) }
        statChanges = apiModel.stat_changes.map { MoveStatChange(apiModel: $0) }
        superContestEffect = apiModel.super_contest_effect?.url
        target = MoveTargetName(rawValue: apiModel.target.name)
        type = TypeName(rawValue: apiModel.type.name)
        learnedByPokemon = apiModel.learned_by_pokemon.map { PokemonName(rawValue: $0.name) }
        flavorTextEntries = apiModel.flavor_text_entries.map { MoveFlavorText(apiModel: $0) }
    }
}

extension Move.ContestComboDetail {
    init(apiModel: ContestComboDetailResponse) {
        useBefore = apiModel.use_before?.map { MoveName(rawValue: $0.name) }
        useAfter = apiModel.use_after?.map { MoveName(rawValue: $0.name) }
    }
}

extension Move.MoveFlavorText {
    init(apiModel: MoveFlavorTextResponse) {
        flavorText = apiModel.flavor_text
        language = LanguageName(rawValue: apiModel.language.name)
        versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}

extension Move.MoveMeta {
    init(apiModel: MoveMetaDataResponse) {
        ailment = MoveAilmentName(rawValue: apiModel.ailment.name)
        category = MoveCategoryName(rawValue: apiModel.category.name)
        minHits = apiModel.min_hits
        maxHits = apiModel.max_hits
        minTurns = apiModel.min_turns
        maxTurns = apiModel.max_turns
        drain = apiModel.drain
        healing = apiModel.healing
        critRate = apiModel.crit_rate
        ailmentChance = apiModel.ailment_chance
        flinchChance = apiModel.flinch_chance
        statChance = apiModel.stat_chance
    }
}

extension Move.MoveStatChange {
    init(apiModel: MoveStatChangeResponse) {
        change = apiModel.change
        stat = StatName(rawValue: apiModel.stat.name)
    }
}

extension Move.PastMoveStatValues {
    init(apiModel: PastMoveStatValuesResponse) {
        accuracy = apiModel.accuracy
        effectChance = apiModel.effect_chance
        power = apiModel.power
        pp = apiModel.pp
        effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        type = TypeName(rawValue: apiModel.type.name)
        versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}

extension Ability.VerboseEffect {
    init(apiModel: VerboseEffectResponse) {
        effect = apiModel.effect
        language = LanguageName(rawValue: apiModel.language.name)
        shortEffect = apiModel.short_effect
    }
}

extension Ability.EffectChange {
    init(apiModel: AbilityEffectChangeResponse) {
        versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
    }
}

extension MoveAilment {
    init(apiModel: MoveAilmentResponse) {
        id = apiModel.id
        name = MoveAilmentName(rawValue: apiModel.name)
        moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension MoveBattleStyle {
    init(apiModel: MoveBattleStyleResponse) {
        id = apiModel.id
        name = MoveBattleStyleName(rawValue: apiModel.name)
        names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension MoveCategory {
    init(apiModel: MoveCategoryResponse) {
        id = apiModel.id
        name = MoveCategoryName(rawValue: apiModel.name)
        moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
    }
}

extension MoveDamageClass {
    init(apiModel: MoveDamageClassResponse) {
        id = apiModel.id
        name = MoveDamageClassName(rawValue: apiModel.name)
        descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        names = apiModel.names.map { Name(apiModel: $0) }
    }
}

extension MoveLearnMethod {
    init(apiModel: MoveLearnMethodResponse) {
        id = apiModel.id
        name = MoveLearnMethodName(rawValue: apiModel.name)
        descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        names = apiModel.names.map { Name(apiModel: $0) }
        versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
    }
}

extension MoveTarget {
    init(apiModel: MoveTargetResponse) {
        id = apiModel.id
        name = MoveTargetName(rawValue: apiModel.name)
        descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        names = apiModel.names.map { Name(apiModel: $0) }
    }
}
