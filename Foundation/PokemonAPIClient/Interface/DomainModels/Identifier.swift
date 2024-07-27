import Foundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct BerryListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: BerryName
}

@MemberwiseInit(.public)
public struct BerryFirmnessListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: BerryFirmnessName
}

@MemberwiseInit(.public)
public struct BerryFlavorListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: BerryFlavorName
}

@MemberwiseInit(.public)
public struct ContestTypeListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ContestTypeName
}

@MemberwiseInit(.public)
public struct ContestEffectListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ContestEffectID
}

@MemberwiseInit(.public)
public struct SuperContestEffectListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ContestEffectID
}

@MemberwiseInit(.public)
public struct EncounterMethodListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: EncounterMethodName
}

@MemberwiseInit(.public)
public struct EncounterConditionListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: EncounterConditionName
}

@MemberwiseInit(.public)
public struct EncounterConditionValueListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: EncounterConditionValueName
}

@MemberwiseInit(.public)
public struct EvolutionChainListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: EvolutionChainID
}

@MemberwiseInit(.public)
public struct EvolutionTriggerListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: EvolutionTriggerName
}

@MemberwiseInit(.public)
public struct GenerationListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: GenerationName
}

@MemberwiseInit(.public)
public struct PokedexListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokedexName
}

@MemberwiseInit(.public)
public struct VersionListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: VersionName
}

@MemberwiseInit(.public)
public struct VersionGroupListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: VersionGroupName
}

@MemberwiseInit(.public)
public struct ItemListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ItemName
}

@MemberwiseInit(.public)
public struct ItemAttributeListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ItemAttributeName
}

@MemberwiseInit(.public)
public struct ItemCategoryListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ItemCategoryName
}

@MemberwiseInit(.public)
public struct ItemFlingEffectListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ItemFlingEffectName
}

@MemberwiseInit(.public)
public struct ItemPocketListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: ItemPocketName
}

@MemberwiseInit(.public)
public struct LocationListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: LocationName
}

@MemberwiseInit(.public)
public struct LocationAreaListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: LocationAreaName
}

@MemberwiseInit(.public)
public struct PalParkAreaListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PalParkAreaName
}

@MemberwiseInit(.public)
public struct RegionListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: RegionName
}

@MemberwiseInit(.public)
public struct MachineListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MachineID
}

@MemberwiseInit(.public)
public struct MoveListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveName
}

@MemberwiseInit(.public)
public struct MoveAilmentListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveAilmentName
}

@MemberwiseInit(.public)
public struct MoveBattleStyleListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveBattleStyleName
}

@MemberwiseInit(.public)
public struct MoveCategoryListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveCategoryName
}

@MemberwiseInit(.public)
public struct MoveDamageClassListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveDamageClassName
}

@MemberwiseInit(.public)
public struct MoveLearnMethodListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveLearnMethodName
}

@MemberwiseInit(.public)
public struct MoveTargetListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: MoveTargetName
}

@MemberwiseInit(.public)
public struct AbilityListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: AbilityName
}

@MemberwiseInit(.public)
public struct CharacteristicListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: CharacteristicID
}

@MemberwiseInit(.public)
public struct EggGroupListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: EggGroupName
}

@MemberwiseInit(.public)
public struct GenderListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: GenderName
}

@MemberwiseInit(.public)
public struct GrowthRateListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: GrowthRateName
}

@MemberwiseInit(.public)
public struct NatureListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: NatureName
}

@MemberwiseInit(.public)
public struct PokeathlonStatListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokeathlonStatName
}

@MemberwiseInit(.public)
public struct PokemonListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokemonName
}

@MemberwiseInit(.public)
public struct PokemonColorListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokemonColorName
}

@MemberwiseInit(.public)
public struct PokemonFormListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokemonFormName
}

@MemberwiseInit(.public)
public struct PokemonHabitatListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokemonHabitatName
}

@MemberwiseInit(.public)
public struct PokemonShapeListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokemonShapeName
}

@MemberwiseInit(.public)
public struct PokemonSpeciesListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: PokemonSpeciesName
}

@MemberwiseInit(.public)
public struct StatListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: StatName
}

@MemberwiseInit(.public)
public struct TypeListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: TypeName
}

@MemberwiseInit(.public)
public struct LanguageListIdentifier: Codable, Identifiable, Hashable {
    public var id: String
    public var name: LanguageName
}

