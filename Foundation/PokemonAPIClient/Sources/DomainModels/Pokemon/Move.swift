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
        self.name = apiModel.name
        self.language = LanguageName(rawValue: apiModel.language.name)
    }
}

extension Description {
    init(apiModel: DescriptionResponse) {
        self.description = apiModel.description
        self.language = LanguageName(rawValue: apiModel.language.name)
    }
}

// Extensions to map API response models to domain models
extension Move {
    init(apiModel: MoveResponse) {
        self.id = apiModel.id
        self.name = MoveName(rawValue: apiModel.name)
        self.accuracy = apiModel.accuracy
        self.effectChance = apiModel.effect_chance
        self.pp = apiModel.pp
        self.priority = apiModel.priority
        self.power = apiModel.power
        self.contestCombos = apiModel.contest_combos.map { ContestComboSets(normal: ContestComboDetail(useBefore: $0.normal.use_before?.map { MoveName(rawValue: $0.name) }, useAfter: $0.normal.use_after?.map { MoveName(rawValue: $0.name) }), super: ContestComboDetail(useBefore: $0.super.use_before?.map { MoveName(rawValue: $0.name) }, useAfter: $0.super.use_after?.map { MoveName(rawValue: $0.name) })) }
        self.contestType = apiModel.contest_type.map { ContestTypeName(rawValue: $0.name) }
        self.contestEffect = apiModel.contest_effect?.url
        self.damageClass = MoveDamageClassName(rawValue: apiModel.damage_class.name)
        self.effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        self.effectChanges = apiModel.effect_changes.map { Ability.EffectChange(apiModel: $0) }
        self.generation = GenerationName(rawValue: apiModel.generation.name)
        self.meta = apiModel.meta.map { MoveMeta(apiModel: $0) }
        self.names = apiModel.names.map { Name(apiModel: $0) }
        self.pastValues = apiModel.past_values.map { PastMoveStatValues(apiModel: $0) }
        self.statChanges = apiModel.stat_changes.map { MoveStatChange(apiModel: $0) }
        self.superContestEffect = apiModel.super_contest_effect?.url
        self.target = MoveTargetName(rawValue: apiModel.target.name)
        self.type = TypeName(rawValue: apiModel.type.name)
        self.learnedByPokemon = apiModel.learned_by_pokemon.map { PokemonName(rawValue: $0.name) }
        self.flavorTextEntries = apiModel.flavor_text_entries.map { MoveFlavorText(apiModel: $0) }
    }
}

extension Move.ContestComboDetail {
    init(apiModel: ContestComboDetailResponse) {
        self.useBefore = apiModel.use_before?.map { MoveName(rawValue: $0.name) }
        self.useAfter = apiModel.use_after?.map { MoveName(rawValue: $0.name) }
    }
}

extension Move.MoveFlavorText {
    init(apiModel: MoveFlavorTextResponse) {
        self.flavorText = apiModel.flavor_text
        self.language = LanguageName(rawValue: apiModel.language.name)
        self.versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}

extension Move.MoveMeta {
    init(apiModel: MoveMetaDataResponse) {
        self.ailment = MoveAilmentName(rawValue: apiModel.ailment.name)
        self.category = MoveCategoryName(rawValue: apiModel.category.name)
        self.minHits = apiModel.min_hits
        self.maxHits = apiModel.max_hits
        self.minTurns = apiModel.min_turns
        self.maxTurns = apiModel.max_turns
        self.drain = apiModel.drain
        self.healing = apiModel.healing
        self.critRate = apiModel.crit_rate
        self.ailmentChance = apiModel.ailment_chance
        self.flinchChance = apiModel.flinch_chance
        self.statChance = apiModel.stat_chance
    }
}

extension Move.MoveStatChange {
    init(apiModel: MoveStatChangeResponse) {
        self.change = apiModel.change
        self.stat = StatName(rawValue: apiModel.stat.name)
    }
}

extension Move.PastMoveStatValues {
    init(apiModel: PastMoveStatValuesResponse) {
        self.accuracy = apiModel.accuracy
        self.effectChance = apiModel.effect_chance
        self.power = apiModel.power
        self.pp = apiModel.pp
        self.effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
        self.type = TypeName(rawValue: apiModel.type.name)
        self.versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}

extension Ability.VerboseEffect {
    init(apiModel: VerboseEffectResponse) {
        self.effect = apiModel.effect
        self.language = LanguageName(rawValue: apiModel.language.name)
        self.shortEffect = apiModel.short_effect
    }
}

extension Ability.EffectChange {
    init(apiModel: AbilityEffectChangeResponse) {
        self.versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        self.effectEntries = apiModel.effect_entries.map { Ability.VerboseEffect(apiModel: $0) }
    }
}


extension MoveAilment {
    init(apiModel: MoveAilmentResponse) {
        self.id = apiModel.id
        self.name = MoveAilmentName(rawValue: apiModel.name)
        self.moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension MoveBattleStyle {
    init(apiModel: MoveBattleStyleResponse) {
        self.id = apiModel.id
        self.name = MoveBattleStyleName(rawValue: apiModel.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension MoveCategory {
    init(apiModel: MoveCategoryResponse) {
        self.id = apiModel.id
        self.name = MoveCategoryName(rawValue: apiModel.name)
        self.moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        self.descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
    }
}

extension MoveDamageClass {
    init(apiModel: MoveDamageClassResponse) {
        self.id = apiModel.id
        self.name = MoveDamageClassName(rawValue: apiModel.name)
        self.descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        self.moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(apiModel: $0) }
    }
}

extension MoveLearnMethod {
    init(apiModel: MoveLearnMethodResponse) {
        self.id = apiModel.id
        self.name = MoveLearnMethodName(rawValue: apiModel.name)
        self.descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        self.names = apiModel.names.map { Name(apiModel: $0) }
        self.versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }
    }
}

extension MoveTarget {
    init(apiModel: MoveTargetResponse) {
        self.id = apiModel.id
        self.name = MoveTargetName(rawValue: apiModel.name)
        self.descriptions = apiModel.descriptions.map { Description(apiModel: $0) }
        self.moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(apiModel: $0) }
    }
}
