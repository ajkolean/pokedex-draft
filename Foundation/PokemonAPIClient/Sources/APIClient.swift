import Foundation

// Define NetworkManager


// Define PokemonAPIClient
struct APIClient {
    public var fetchBerry: @Sendable (_ name: BerryName) async throws -> BerryResponse
    public var fetchBerryList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchBerryFirmness: @Sendable (_ name: BerryFirmnessName) async throws -> BerryFirmnessResponse
    public var fetchBerryFirmnessList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchBerryFlavor: @Sendable (_ name: BerryFlavorName) async throws -> BerryFlavorResponse
    public var fetchBerryFlavorList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchContestType: @Sendable (_ name: ContestTypeName) async throws -> ContestTypeResponse
    public var fetchContestTypeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchContestEffect: @Sendable (_ id: ContestEffectID) async throws -> ContestEffectResponse
    public var fetchContestEffectList: @Sendable (_ limit: Int, _ offset: Int) async throws -> APIResourceListResponse
    public var fetchSuperContestEffect: @Sendable (_ id: ContestEffectID) async throws -> SuperContestEffectResponse
    public var fetchSuperContestEffectList: @Sendable (_ limit: Int, _ offset: Int) async throws -> APIResourceListResponse
    public var fetchEncounterMethod: @Sendable (_ name: EncounterMethodName) async throws -> EncounterMethodResponse
    public var fetchEncounterMethodList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchEncounterCondition: @Sendable (_ name: EncounterConditionName) async throws -> EncounterConditionResponse
    public var fetchEncounterConditionList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchEncounterConditionValue: @Sendable (_ name: EncounterConditionValueName) async throws -> EncounterConditionValueResponse
    public var fetchEncounterConditionValueList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchEvolutionChain: @Sendable (_ id: EvolutionChainID) async throws -> EvolutionChainResponse
    public var fetchEvolutionChainList: @Sendable (_ limit: Int, _ offset: Int) async throws -> APIResourceListResponse
    public var fetchEvolutionTrigger: @Sendable (_ name: EvolutionTriggerName) async throws -> EvolutionTriggerResponse
    public var fetchEvolutionTriggerList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchGeneration: @Sendable (_ name: GenerationName) async throws -> GenerationResponse
    public var fetchGenerationList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokedex: @Sendable (_ name: PokedexName) async throws -> PokedexResponse
    public var fetchPokedexList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchVersion: @Sendable (_ name: VersionName) async throws -> VersionResponse
    public var fetchVersionList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchVersionGroup: @Sendable (_ name: VersionGroupName) async throws -> VersionGroupResponse
    public var fetchVersionGroupList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchItem: @Sendable (_ name: ItemName) async throws -> ItemResponse
    public var fetchItemList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchItemAttribute: @Sendable (_ name: ItemAttributeName) async throws -> ItemAttributeResponse
    public var fetchItemAttributeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchItemCategory: @Sendable (_ name: ItemCategoryName) async throws -> ItemCategoryResponse
    public var fetchItemCategoryList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchItemFlingEffect: @Sendable (_ name: ItemFlingEffectName) async throws -> ItemFlingEffectResponse
    public var fetchItemFlingEffectList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchItemPocket: @Sendable (_ name: ItemPocketName) async throws -> ItemPocketResponse
    public var fetchItemPocketList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchLocation: @Sendable (_ name: LocationName) async throws -> LocationResponse
    public var fetchLocationList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchLocationArea: @Sendable (_ name: LocationAreaName) async throws -> LocationAreaResponse
    public var fetchLocationAreaList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPalParkArea: @Sendable (_ name: PalParkAreaName) async throws -> PalParkAreaResponse
    public var fetchPalParkAreaList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchRegion: @Sendable (_ name: RegionName) async throws -> RegionResponse
    public var fetchRegionList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMachine: @Sendable (_ id: MachineID) async throws -> MachineResponse
    public var fetchMachineList: @Sendable (_ limit: Int, _ offset: Int) async throws -> APIResourceListResponse
    public var fetchMove: @Sendable (_ name: MoveName) async throws -> MoveResponse
    public var fetchMoveList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMoveAilment: @Sendable (_ name: MoveAilmentName) async throws -> MoveAilmentResponse
    public var fetchMoveAilmentList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMoveBattleStyle: @Sendable (_ name: MoveBattleStyleName) async throws -> MoveBattleStyleResponse
    public var fetchMoveBattleStyleList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMoveCategory: @Sendable (_ name: MoveCategoryName) async throws -> MoveCategoryResponse
    public var fetchMoveCategoryList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMoveDamageClass: @Sendable (_ name: MoveDamageClassName) async throws -> MoveDamageClassResponse
    public var fetchMoveDamageClassList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMoveLearnMethod: @Sendable (_ name: MoveLearnMethodName) async throws -> MoveLearnMethodResponse
    public var fetchMoveLearnMethodList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchMoveTarget: @Sendable (_ name: MoveTargetName) async throws -> MoveTargetResponse
    public var fetchMoveTargetList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchAbility: @Sendable (_ name: AbilityName) async throws -> AbilityResponse
    public var fetchAbilityList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchCharacteristic: @Sendable (_ id: CharacteristicID) async throws -> CharacteristicResponse
    public var fetchCharacteristicList: @Sendable (_ limit: Int, _ offset: Int) async throws -> APIResourceListResponse
    public var fetchEggGroup: @Sendable (_ name: EggGroupName) async throws -> EggGroupResponse
    public var fetchEggGroupList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchGender: @Sendable (_ name: GenderName) async throws -> GenderResponse
    public var fetchGenderList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchGrowthRate: @Sendable (_ name: GrowthRateName) async throws -> GrowthRateResponse
    public var fetchGrowthRateList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchNature: @Sendable (_ name: NatureName) async throws -> NatureResponse
    public var fetchNatureList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokeathlonStat: @Sendable (_ name: PokeathlonStatName) async throws -> PokeathlonStatResponse
    public var fetchPokeathlonStatList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokemon: @Sendable (_ name: PokemonName) async throws -> PokemonResponse
    public var fetchPokemonList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokemonColor: @Sendable (_ name: PokemonColorName) async throws -> PokemonColorResponse
    public var fetchPokemonColorList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokemonForm: @Sendable (_ name: PokemonFormName) async throws -> PokemonFormResponse
    public var fetchPokemonFormList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokemonHabitat: @Sendable (_ name: PokemonHabitatName) async throws -> PokemonHabitatResponse
    public var fetchPokemonHabitatList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokemonShape: @Sendable (_ name: PokemonShapeName) async throws -> PokemonShapeResponse
    public var fetchPokemonShapeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchPokemonSpecies: @Sendable (_ name: PokemonSpeciesName) async throws -> PokemonSpeciesResponse
    public var fetchPokemonSpeciesList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchStat: @Sendable (_ name: StatName) async throws -> StatResponse
    public var fetchStatList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchType: @Sendable (_ name: TypeName) async throws -> TypeResponse
    public var fetchTypeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
    public var fetchLanguage: @Sendable (_ name: LanguageName) async throws -> LanguageResponse
    public var fetchLanguageList: @Sendable (_ limit: Int, _ offset: Int) async throws -> NamedAPIResourceListResponse
}

// Define live instance of PokemonAPIClient
extension APIClient {
     static let liveValue = Self(
        fetchBerry: { name in
            try await NetworkManager.shared.fetch(BerryResponse.self, endpoint: .berry, identifier: name)
        },
        fetchBerryList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .berry, limit: limit, offset: offset)
        },
        fetchBerryFirmness: { name in
            try await NetworkManager.shared.fetch(BerryFirmnessResponse.self, endpoint: .berryFirmness, identifier: name)
        },
        fetchBerryFirmnessList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .berryFirmness, limit: limit, offset: offset)
        },
        fetchBerryFlavor: { name in
            try await NetworkManager.shared.fetch(BerryFlavorResponse.self, endpoint: .berryFlavor, identifier: name)
        },
        fetchBerryFlavorList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .berryFlavor, limit: limit, offset: offset)
        },
        fetchContestType: { name in
            try await NetworkManager.shared.fetch(ContestTypeResponse.self, endpoint: .contestType, identifier: name)
        },
        fetchContestTypeList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .contestType, limit: limit, offset: offset)
        },
        fetchContestEffect: { id in
            try await NetworkManager.shared.fetch(ContestEffectResponse.self, endpoint: .contestEffect, identifier: id)
        },
        fetchContestEffectList: { limit, offset in
            try await NetworkManager.shared.fetchList(APIResourceListResponse.self, endpoint: .contestEffect, limit: limit, offset: offset)
        },
        fetchSuperContestEffect: { id in
            try await NetworkManager.shared.fetch(SuperContestEffectResponse.self, endpoint: .superContestEffect, identifier: id)
        },
        fetchSuperContestEffectList: { limit, offset in
            try await NetworkManager.shared.fetchList(APIResourceListResponse.self, endpoint: .superContestEffect, limit: limit, offset: offset)
        },
        fetchEncounterMethod: { name in
            try await NetworkManager.shared.fetch(EncounterMethodResponse.self, endpoint: .encounterMethod, identifier: name)
        },
        fetchEncounterMethodList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .encounterMethod, limit: limit, offset: offset)
        },
        fetchEncounterCondition: { name in
            try await NetworkManager.shared.fetch(EncounterConditionResponse.self, endpoint: .encounterCondition, identifier: name)
        },
        fetchEncounterConditionList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .encounterCondition, limit: limit, offset: offset)
        },
        fetchEncounterConditionValue: { name in
            try await NetworkManager.shared.fetch(EncounterConditionValueResponse.self, endpoint: .encounterConditionValue, identifier: name)
        },
        fetchEncounterConditionValueList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .encounterConditionValue, limit: limit, offset: offset)
        },
        fetchEvolutionChain: { id in
            try await NetworkManager.shared.fetch(EvolutionChainResponse.self, endpoint: .evolutionChain, identifier: id)
        },
        fetchEvolutionChainList: { limit, offset in
            try await NetworkManager.shared.fetchList(APIResourceListResponse.self, endpoint: .evolutionChain, limit: limit, offset: offset)
        },
        fetchEvolutionTrigger: { name in
            try await NetworkManager.shared.fetch(EvolutionTriggerResponse.self, endpoint: .evolutionTrigger, identifier: name)
        },
        fetchEvolutionTriggerList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .evolutionTrigger, limit: limit, offset: offset)
        },
        fetchGeneration: { name in
            try await NetworkManager.shared.fetch(GenerationResponse.self, endpoint: .generation, identifier: name)
        },
        fetchGenerationList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .generation, limit: limit, offset: offset)
        },
        fetchPokedex: { name in
            try await NetworkManager.shared.fetch(PokedexResponse.self, endpoint: .pokedex, identifier: name)
        },
        fetchPokedexList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokedex, limit: limit, offset: offset)
        },
        fetchVersion: { name in
            try await NetworkManager.shared.fetch(VersionResponse.self, endpoint: .version, identifier: name)
        },
        fetchVersionList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .version, limit: limit, offset: offset)
        },
        fetchVersionGroup: { name in
            try await NetworkManager.shared.fetch(VersionGroupResponse.self, endpoint: .versionGroup, identifier: name)
        },
        fetchVersionGroupList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .versionGroup, limit: limit, offset: offset)
        },
        fetchItem: { name in
            try await NetworkManager.shared.fetch(ItemResponse.self, endpoint: .item, identifier: name)
        },
        fetchItemList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .item, limit: limit, offset: offset)
        },
        fetchItemAttribute: { name in
            try await NetworkManager.shared.fetch(ItemAttributeResponse.self, endpoint: .itemAttribute, identifier: name)
        },
        fetchItemAttributeList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .itemAttribute, limit: limit, offset: offset)
        },
        fetchItemCategory: { name in
            try await NetworkManager.shared.fetch(ItemCategoryResponse.self, endpoint: .itemCategory, identifier: name)
        },
        fetchItemCategoryList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .itemCategory, limit: limit, offset: offset)
        },
        fetchItemFlingEffect: { name in
            try await NetworkManager.shared.fetch(ItemFlingEffectResponse.self, endpoint: .itemFlingEffect, identifier: name)
        },
        fetchItemFlingEffectList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .itemFlingEffect, limit: limit, offset: offset)
        },
        fetchItemPocket: { name in
            try await NetworkManager.shared.fetch(ItemPocketResponse.self, endpoint: .itemPocket, identifier: name)
        },
        fetchItemPocketList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .itemPocket, limit: limit, offset: offset)
        },
        fetchLocation: { name in
            try await NetworkManager.shared.fetch(LocationResponse.self, endpoint: .location, identifier: name)
        },
        fetchLocationList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .location, limit: limit, offset: offset)
        },
        fetchLocationArea: { name in
            try await NetworkManager.shared.fetch(LocationAreaResponse.self, endpoint: .locationArea, identifier: name)
        },
        fetchLocationAreaList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .locationArea, limit: limit, offset: offset)
        },
        fetchPalParkArea: { name in
            try await NetworkManager.shared.fetch(PalParkAreaResponse.self, endpoint: .palParkArea, identifier: name)
        },
        fetchPalParkAreaList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .palParkArea, limit: limit, offset: offset)
        },
        fetchRegion: { name in
            try await NetworkManager.shared.fetch(RegionResponse.self, endpoint: .region, identifier: name)
        },
        fetchRegionList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .region, limit: limit, offset: offset)
        },
        fetchMachine: { id in
            try await NetworkManager.shared.fetch(MachineResponse.self, endpoint: .machine, identifier: id)
        },
        fetchMachineList: { limit, offset in
            try await NetworkManager.shared.fetchList(APIResourceListResponse.self, endpoint: .machine, limit: limit, offset: offset)
        },
        fetchMove: { name in
            try await NetworkManager.shared.fetch(MoveResponse.self, endpoint: .move, identifier: name)
        },
        fetchMoveList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .move, limit: limit, offset: offset)
        },
        fetchMoveAilment: { name in
            try await NetworkManager.shared.fetch(MoveAilmentResponse.self, endpoint: .moveAilment, identifier: name)
        },
        fetchMoveAilmentList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .moveAilment, limit: limit, offset: offset)
        },
        fetchMoveBattleStyle: { name in
            try await NetworkManager.shared.fetch(MoveBattleStyleResponse.self, endpoint: .moveBattleStyle, identifier: name)
        },
        fetchMoveBattleStyleList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .moveBattleStyle, limit: limit, offset: offset)
        },
        fetchMoveCategory: { name in
            try await NetworkManager.shared.fetch(MoveCategoryResponse.self, endpoint: .moveCategory, identifier: name)
        },
        fetchMoveCategoryList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .moveCategory, limit: limit, offset: offset)
        },
        fetchMoveDamageClass: { name in
            try await NetworkManager.shared.fetch(MoveDamageClassResponse.self, endpoint: .moveDamageClass, identifier: name)
        },
        fetchMoveDamageClassList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .moveDamageClass, limit: limit, offset: offset)
        },
        fetchMoveLearnMethod: { name in
            try await NetworkManager.shared.fetch(MoveLearnMethodResponse.self, endpoint: .moveLearnMethod, identifier: name)
        },
        fetchMoveLearnMethodList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .moveLearnMethod, limit: limit, offset: offset)
        },
        fetchMoveTarget: { name in
            try await NetworkManager.shared.fetch(MoveTargetResponse.self, endpoint: .moveTarget, identifier: name)
        },
        fetchMoveTargetList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .moveTarget, limit: limit, offset: offset)
        },
        fetchAbility: { name in
            try await NetworkManager.shared.fetch(AbilityResponse.self, endpoint: .ability, identifier: name)
        },
        fetchAbilityList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .ability, limit: limit, offset: offset)
        },
        fetchCharacteristic: { id in
            try await NetworkManager.shared.fetch(CharacteristicResponse.self, endpoint: .characteristic, identifier: id)
        },
        fetchCharacteristicList: { limit, offset in
            try await NetworkManager.shared.fetchList(APIResourceListResponse.self, endpoint: .characteristic, limit: limit, offset: offset)
        },
        fetchEggGroup: { name in
            try await NetworkManager.shared.fetch(EggGroupResponse.self, endpoint: .eggGroup, identifier: name)
        },
        fetchEggGroupList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .eggGroup, limit: limit, offset: offset)
        },
        fetchGender: { name in
            try await NetworkManager.shared.fetch(GenderResponse.self, endpoint: .gender, identifier: name)
        },
        fetchGenderList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .gender, limit: limit, offset: offset)
        },
        fetchGrowthRate: { name in
            try await NetworkManager.shared.fetch(GrowthRateResponse.self, endpoint: .growthRate, identifier: name)
        },
        fetchGrowthRateList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .growthRate, limit: limit, offset: offset)
        },
        fetchNature: { name in
            try await NetworkManager.shared.fetch(NatureResponse.self, endpoint: .nature, identifier: name)
        },
        fetchNatureList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .nature, limit: limit, offset: offset)
        },
        fetchPokeathlonStat: { name in
            try await NetworkManager.shared.fetch(PokeathlonStatResponse.self, endpoint: .pokeathlonStat, identifier: name)
        },
        fetchPokeathlonStatList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokeathlonStat, limit: limit, offset: offset)
        },
        fetchPokemon: { name in
            try await NetworkManager.shared.fetch(PokemonResponse.self, endpoint: .pokemon, identifier: name)
        },
        fetchPokemonList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokemon, limit: limit, offset: offset)
        },
        fetchPokemonColor: { name in
            try await NetworkManager.shared.fetch(PokemonColorResponse.self, endpoint: .pokemonColor, identifier: name)
        },
        fetchPokemonColorList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokemonColor, limit: limit, offset: offset)
        },
        fetchPokemonForm: { name in
            try await NetworkManager.shared.fetch(PokemonFormResponse.self, endpoint: .pokemonForm, identifier: name)
        },
        fetchPokemonFormList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokemonForm, limit: limit, offset: offset)
        },
        fetchPokemonHabitat: { name in
            try await NetworkManager.shared.fetch(PokemonHabitatResponse.self, endpoint: .pokemonHabitat, identifier: name)
        },
        fetchPokemonHabitatList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokemonHabitat, limit: limit, offset: offset)
        },
        fetchPokemonShape: { name in
            try await NetworkManager.shared.fetch(PokemonShapeResponse.self, endpoint: .pokemonShape, identifier: name)
        },
        fetchPokemonShapeList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokemonShape, limit: limit, offset: offset)
        },
        fetchPokemonSpecies: { name in
            try await NetworkManager.shared.fetch(PokemonSpeciesResponse.self, endpoint: .pokemonSpecies, identifier: name)
        },
        fetchPokemonSpeciesList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .pokemonSpecies, limit: limit, offset: offset)
        },
        fetchStat: { name in
            try await NetworkManager.shared.fetch(StatResponse.self, endpoint: .stat, identifier: name)
        },
        fetchStatList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .stat, limit: limit, offset: offset)
        },
        fetchType: { name in
            try await NetworkManager.shared.fetch(TypeResponse.self, endpoint: .type, identifier: name)
        },
        fetchTypeList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .type, limit: limit, offset: offset)
        },
        fetchLanguage: { name in
            try await NetworkManager.shared.fetch(LanguageResponse.self, endpoint: .language, identifier: name)
        },
        fetchLanguageList: { limit, offset in
            try await NetworkManager.shared.fetchList(NamedAPIResourceListResponse.self, endpoint: .language, limit: limit, offset: offset)
        }
    )
}
