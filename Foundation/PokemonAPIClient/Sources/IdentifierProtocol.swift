import Foundation

public protocol IdentifierProtocol: RawRepresentable, Codable, Hashable, Identifiable {}

extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }
}

extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
    public var id: String { rawValue }
}

extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
    public init(integerLiteral value: Int) {
        self.init(rawValue: value)!
    }
}

extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
    public var id: Int { rawValue }
}

// Identifiers for endpoints that accept names (String)
public struct PokemonName: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct BerryName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct BerryFlavorName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct BerryFirmnessName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct LocationName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct LocationAreaName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PalParkAreaName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct RegionName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct ContestTypeName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct EncounterMethodName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct EncounterConditionName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct EncounterConditionValueName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct EvolutionTriggerName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct GenerationName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokedexName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct VersionName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct VersionGroupName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct ItemName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct ItemAttributeName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct ItemCategoryName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct ItemFlingEffectName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct ItemPocketName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveAilmentName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveBattleStyleName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveCategoryName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveDamageClassName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveLearnMethodName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MoveTargetName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct AbilityName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct EggGroupName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct GenderName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct GrowthRateName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct NatureName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokeathlonStatName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokemonColorName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokemonFormName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokemonHabitatName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokemonShapeName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct PokemonSpeciesName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct StatName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct TypeName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct LanguageName: IdentifierProtocol, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

// Identifiers for endpoints that accept IDs (Int)
public struct ContestEffectID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct SuperContestEffectID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct EvolutionChainID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct CharacteristicID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct MachineID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct EncounterConditionValueID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
