import Foundation
import MemberwiseInit

// Domain model for Move
@MemberwiseInit(.public)
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

    @MemberwiseInit(.public)
    public struct ContestComboSets: Codable, Hashable {
        public let normal: ContestComboDetail
        public let `super`: ContestComboDetail
    }

    @MemberwiseInit(.public)
    public struct ContestComboDetail: Codable, Hashable {
        public let useBefore: [MoveName]?
        public let useAfter: [MoveName]?
    }

    @MemberwiseInit(.public)
    public struct MoveFlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
        public let versionGroup: VersionGroupName
    }

    @MemberwiseInit(.public)
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

    @MemberwiseInit(.public)
    public struct MoveStatChange: Codable, Hashable {
        public let change: Int
        public let stat: StatName
    }

    @MemberwiseInit(.public)
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
@MemberwiseInit(.public)
public struct MoveAilment: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveAilmentName
    public let moves: [MoveName]
    public let names: [Name]
}

// Domain model for MoveBattleStyle
@MemberwiseInit(.public)
public struct MoveBattleStyle: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveBattleStyleName
    public let names: [Name]
}

// Domain model for MoveCategory
@MemberwiseInit(.public)
public struct MoveCategory: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveCategoryName
    public let moves: [MoveName]
    public let descriptions: [Description]
}

// Domain model for MoveDamageClass
@MemberwiseInit(.public)
public struct MoveDamageClass: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveDamageClassName
    public let descriptions: [Description]
    public let moves: [MoveName]
    public let names: [Name]
}

// Domain model for MoveLearnMethod
@MemberwiseInit(.public)
public struct MoveLearnMethod: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveLearnMethodName
    public let descriptions: [Description]
    public let names: [Name]
    public let versionGroups: [VersionGroupName]
}

// Domain model for MoveTarget
@MemberwiseInit(.public)
public struct MoveTarget: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: MoveTargetName
    public let descriptions: [Description]
    public let moves: [MoveName]
    public let names: [Name]
}
