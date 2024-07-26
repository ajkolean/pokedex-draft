import Foundation

protocol IdentifierProtocol: RawRepresentable, Codable, Equatable {}

extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
    init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }
}

extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
    init(integerLiteral value: Int) {
        self.init(rawValue: value)!
    }
}

// Identifiers for endpoints that accept names (String)
struct PokemonName: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct BerryName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct BerryFlavorName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct BerryFirmnessName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct LocationName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct LocationAreaName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PalParkAreaName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct RegionName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct ContestTypeName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct EncounterMethodName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct EncounterConditionName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct EncounterConditionValueName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct EvolutionTriggerName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct GenerationName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokedexName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct VersionName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct VersionGroupName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct ItemName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct ItemAttributeName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct ItemCategoryName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct ItemFlingEffectName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct ItemPocketName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveAilmentName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveBattleStyleName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveCategoryName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveDamageClassName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveLearnMethodName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct MoveTargetName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct AbilityName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct EggGroupName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct GenderName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct GrowthRateName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct NatureName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokeathlonStatName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokemonColorName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokemonFormName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokemonHabitatName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokemonShapeName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct PokemonSpeciesName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct StatName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct TypeName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

struct LanguageName: IdentifierProtocol, ExpressibleByStringLiteral {
    let rawValue: String
}

// Identifiers for endpoints that accept IDs (Int)
struct ContestEffectID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    let rawValue: Int
}

struct SuperContestEffectID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    let rawValue: Int
}

struct EvolutionChainID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    let rawValue: Int
}

struct CharacteristicID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    let rawValue: Int
}

struct MachineID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    let rawValue: Int
}

struct EncounterConditionValueID: IdentifierProtocol, ExpressibleByIntegerLiteral {
    let rawValue: Int
}
