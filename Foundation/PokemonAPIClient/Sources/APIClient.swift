import ComposableArchitecture
import Foundation

// Define the APIClient struct
@DependencyClient
public struct APIClient {
    public var fetchBerry: @Sendable (_ name: BerryName) async throws -> Berry
    public var fetchBerryList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [BerryName]
    public var fetchBerryFirmness: @Sendable (_ name: BerryFirmnessName) async throws -> BerryFirmness
    public var fetchBerryFirmnessList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [BerryFirmnessName]
    public var fetchBerryFlavor: @Sendable (_ name: BerryFlavorName) async throws -> BerryFlavor
    public var fetchBerryFlavorList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [BerryFlavorName]
    public var fetchContestType: @Sendable (_ name: ContestTypeName) async throws -> ContestType
    public var fetchContestTypeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ContestTypeName]
    public var fetchContestEffect: @Sendable (_ id: ContestEffectID) async throws -> ContestEffect
    public var fetchContestEffectList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ContestEffectID]
    public var fetchSuperContestEffect: @Sendable (_ id: ContestEffectID) async throws -> SuperContestEffect
    public var fetchSuperContestEffectList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ContestEffectID]
    public var fetchEncounterMethod: @Sendable (_ name: EncounterMethodName) async throws -> EncounterMethod
    public var fetchEncounterMethodList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [EncounterMethodName]
    public var fetchEncounterCondition: @Sendable (_ name: EncounterConditionName) async throws -> EncounterCondition
    public var fetchEncounterConditionList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [EncounterConditionName]
    public var fetchEncounterConditionValue: @Sendable (_ name: EncounterConditionValueName) async throws
        -> EncounterConditionValue
    public var fetchEncounterConditionValueList: @Sendable (_ limit: Int, _ offset: Int) async throws
        -> [EncounterConditionValueName]
    public var fetchEvolutionChain: @Sendable (_ id: EvolutionChainID) async throws -> EvolutionChain
    public var fetchEvolutionChainList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [EvolutionChainID]
    public var fetchEvolutionTrigger: @Sendable (_ name: EvolutionTriggerName) async throws -> EvolutionTrigger
    public var fetchEvolutionTriggerList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [EvolutionTriggerName]
    public var fetchGeneration: @Sendable (_ name: GenerationName) async throws -> Generation
    public var fetchGenerationList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [GenerationName]
    public var fetchPokedex: @Sendable (_ name: PokedexName) async throws -> Pokedex
    public var fetchPokedexList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokedexName]
    public var fetchVersion: @Sendable (_ name: VersionName) async throws -> Version
    public var fetchVersionList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [VersionName]
    public var fetchVersionGroup: @Sendable (_ name: VersionGroupName) async throws -> VersionGroup
    public var fetchVersionGroupList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [VersionGroupName]
    public var fetchItem: @Sendable (_ name: ItemName) async throws -> Item
    public var fetchItemList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ItemName]
    public var fetchItemAttribute: @Sendable (_ name: ItemAttributeName) async throws -> ItemAttribute
    public var fetchItemAttributeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ItemAttributeName]
    public var fetchItemCategory: @Sendable (_ name: ItemCategoryName) async throws -> ItemCategory
    public var fetchItemCategoryList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ItemCategoryName]
    public var fetchItemFlingEffect: @Sendable (_ name: ItemFlingEffectName) async throws -> ItemFlingEffect
    public var fetchItemFlingEffectList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ItemFlingEffectName]
    public var fetchItemPocket: @Sendable (_ name: ItemPocketName) async throws -> ItemPocket
    public var fetchItemPocketList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [ItemPocketName]
    public var fetchLocation: @Sendable (_ name: LocationName) async throws -> Location
    public var fetchLocationList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [LocationName]
    public var fetchLocationArea: @Sendable (_ name: LocationAreaName) async throws -> LocationArea
    public var fetchLocationAreaList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [LocationAreaName]
    public var fetchPalParkArea: @Sendable (_ name: PalParkAreaName) async throws -> PalParkArea
    public var fetchPalParkAreaList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PalParkAreaName]
    public var fetchRegion: @Sendable (_ name: RegionName) async throws -> Region
    public var fetchRegionList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [RegionName]
    public var fetchMachine: @Sendable (_ id: MachineID) async throws -> Machine
    public var fetchMachineList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MachineID]
    public var fetchMove: @Sendable (_ name: MoveName) async throws -> Move
    public var fetchMoveList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveName]
    public var fetchMoveAilment: @Sendable (_ name: MoveAilmentName) async throws -> MoveAilment
    public var fetchMoveAilmentList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveAilmentName]
    public var fetchMoveBattleStyle: @Sendable (_ name: MoveBattleStyleName) async throws -> MoveBattleStyle
    public var fetchMoveBattleStyleList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveBattleStyleName]
    public var fetchMoveCategory: @Sendable (_ name: MoveCategoryName) async throws -> MoveCategory
    public var fetchMoveCategoryList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveCategoryName]
    public var fetchMoveDamageClass: @Sendable (_ name: MoveDamageClassName) async throws -> MoveDamageClass
    public var fetchMoveDamageClassList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveDamageClassName]
    public var fetchMoveLearnMethod: @Sendable (_ name: MoveLearnMethodName) async throws -> MoveLearnMethod
    public var fetchMoveLearnMethodList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveLearnMethodName]
    public var fetchMoveTarget: @Sendable (_ name: MoveTargetName) async throws -> MoveTarget
    public var fetchMoveTargetList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [MoveTargetName]
    public var fetchAbility: @Sendable (_ name: AbilityName) async throws -> Ability
    public var fetchAbilityList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [AbilityName]
    public var fetchCharacteristic: @Sendable (_ id: CharacteristicID) async throws -> Characteristic
    public var fetchCharacteristicList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [CharacteristicID]
    public var fetchEggGroup: @Sendable (_ name: EggGroupName) async throws -> EggGroup
    public var fetchEggGroupList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [EggGroupName]
    public var fetchGender: @Sendable (_ name: GenderName) async throws -> Gender
    public var fetchGenderList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [GenderName]
    public var fetchGrowthRate: @Sendable (_ name: GrowthRateName) async throws -> GrowthRate
    public var fetchGrowthRateList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [GrowthRateName]
    public var fetchNature: @Sendable (_ name: NatureName) async throws -> Nature
    public var fetchNatureList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [NatureName]
    public var fetchPokeathlonStat: @Sendable (_ name: PokeathlonStatName) async throws -> PokeathlonStat
    public var fetchPokeathlonStatList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokeathlonStatName]
    public var fetchPokemon: @Sendable (_ name: PokemonName) async throws -> Pokemon
    public var fetchPokemonList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokemonListIdentifier]
    public var fetchPokemonColor: @Sendable (_ name: PokemonColorName) async throws -> PokemonColor
    public var fetchPokemonColorList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokemonColorName]
    public var fetchPokemonForm: @Sendable (_ name: PokemonFormName) async throws -> PokemonForm
    public var fetchPokemonFormList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokemonFormName]
    public var fetchPokemonHabitat: @Sendable (_ name: PokemonHabitatName) async throws -> PokemonHabitat
    public var fetchPokemonHabitatList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokemonHabitatName]
    public var fetchPokemonShape: @Sendable (_ name: PokemonShapeName) async throws -> PokemonShape
    public var fetchPokemonShapeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokemonShapeName]
    public var fetchPokemonSpecies: @Sendable (_ name: PokemonSpeciesName) async throws -> PokemonSpecies
    public var fetchPokemonSpeciesList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [PokemonSpeciesName]
    public var fetchStat: @Sendable (_ name: StatName) async throws -> Stat
    public var fetchStatList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [StatName]
    public var fetchType: @Sendable (_ name: TypeName) async throws -> PokemonType
    public var fetchTypeList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [TypeName]
    public var fetchLanguageList: @Sendable (_ limit: Int, _ offset: Int) async throws -> [LanguageName]
}

// Define live instance of APIClient
extension APIClient: DependencyKey {
    public static let liveValue = Self(
        fetchBerry: { name in
            let response = try await NetworkManager.shared.fetch(BerryResponse.self, endpoint: .berry, identifier: name)
            return Berry(apiModel: response)
        },
        fetchBerryList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .berry,
                limit: limit,
                offset: offset
            )
            return response.results.map { BerryName(rawValue: $0.name) }
        },
        fetchBerryFirmness: { name in
            let response = try await NetworkManager.shared.fetch(
                BerryFirmnessResponse.self,
                endpoint: .berryFirmness,
                identifier: name
            )
            return BerryFirmness(apiModel: response)
        },
        fetchBerryFirmnessList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .berryFirmness,
                limit: limit,
                offset: offset
            )
            return response.results.map { BerryFirmnessName(rawValue: $0.name) }
        },
        fetchBerryFlavor: { name in
            let response = try await NetworkManager.shared.fetch(
                BerryFlavorResponse.self,
                endpoint: .berryFlavor,
                identifier: name
            )
            return BerryFlavor(apiModel: response)
        },
        fetchBerryFlavorList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .berryFlavor,
                limit: limit,
                offset: offset
            )
            return response.results.map { BerryFlavorName(rawValue: $0.name) }
        },
        fetchContestType: { name in
            let response = try await NetworkManager.shared.fetch(
                ContestTypeResponse.self,
                endpoint: .contestType,
                identifier: name
            )
            return ContestType(apiModel: response)
        },
        fetchContestTypeList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .contestType,
                limit: limit,
                offset: offset
            )
            return response.results.map { ContestTypeName(rawValue: $0.name) }
        },
        fetchContestEffect: { id in
            let response = try await NetworkManager.shared.fetch(
                ContestEffectResponse.self,
                endpoint: .contestEffect,
                identifier: id
            )
            return ContestEffect(apiModel: response)
        },
        fetchContestEffectList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                APIResourceListResponse.self,
                endpoint: .contestEffect,
                limit: limit,
                offset: offset
            )
            return response.results.map { ContestEffectID(rawValue: $0.url.extractID()) }
        },
        fetchSuperContestEffect: { id in
            let response = try await NetworkManager.shared.fetch(
                SuperContestEffectResponse.self,
                endpoint: .superContestEffect,
                identifier: id
            )
            return SuperContestEffect(apiModel: response)
        },
        fetchSuperContestEffectList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                APIResourceListResponse.self,
                endpoint: .superContestEffect,
                limit: limit,
                offset: offset
            )
            return response.results.map { ContestEffectID(rawValue: $0.url.extractID()) }
        },
        fetchEncounterMethod: { name in
            let response = try await NetworkManager.shared.fetch(
                EncounterMethodResponse.self,
                endpoint: .encounterMethod,
                identifier: name
            )
            return EncounterMethod(apiModel: response)
        },
        fetchEncounterMethodList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .encounterMethod,
                limit: limit,
                offset: offset
            )
            return response.results.map { EncounterMethodName(rawValue: $0.name) }
        },
        fetchEncounterCondition: { name in
            let response = try await NetworkManager.shared.fetch(
                EncounterConditionResponse.self,
                endpoint: .encounterCondition,
                identifier: name
            )
            return EncounterCondition(apiModel: response)
        },
        fetchEncounterConditionList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .encounterCondition,
                limit: limit,
                offset: offset
            )
            return response.results.map { EncounterConditionName(rawValue: $0.name) }
        },
        fetchEncounterConditionValue: { name in
            let response = try await NetworkManager.shared.fetch(
                EncounterConditionValueResponse.self,
                endpoint: .encounterConditionValue,
                identifier: name
            )
            return EncounterConditionValue(apiModel: response)
        },
        fetchEncounterConditionValueList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .encounterConditionValue,
                limit: limit,
                offset: offset
            )
            return response.results.map { EncounterConditionValueName(rawValue: $0.name) }
        },
        fetchEvolutionChain: { id in
            let response = try await NetworkManager.shared.fetch(
                EvolutionChainResponse.self,
                endpoint: .evolutionChain,
                identifier: id
            )
            return EvolutionChain(apiModel: response)
        },
        fetchEvolutionChainList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                APIResourceListResponse.self,
                endpoint: .evolutionChain,
                limit: limit,
                offset: offset
            )
            return response.results.map { EvolutionChainID(rawValue: $0.url.extractID()) }
        },
        fetchEvolutionTrigger: { name in
            let response = try await NetworkManager.shared.fetch(
                EvolutionTriggerResponse.self,
                endpoint: .evolutionTrigger,
                identifier: name
            )
            return EvolutionTrigger(apiModel: response)
        },
        fetchEvolutionTriggerList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .evolutionTrigger,
                limit: limit,
                offset: offset
            )
            return response.results.map { EvolutionTriggerName(rawValue: $0.name) }
        },
        fetchGeneration: { name in
            let response = try await NetworkManager.shared.fetch(GenerationResponse.self, endpoint: .generation, identifier: name)
            return Generation(apiModel: response)
        },
        fetchGenerationList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .generation,
                limit: limit,
                offset: offset
            )
            return response.results.map { GenerationName(rawValue: $0.name) }
        },
        fetchPokedex: { name in
            let response = try await NetworkManager.shared.fetch(PokedexResponse.self, endpoint: .pokedex, identifier: name)
            return Pokedex(apiModel: response)
        },
        fetchPokedexList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokedex,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokedexName(rawValue: $0.name) }
        },
        fetchVersion: { name in
            let response = try await NetworkManager.shared.fetch(VersionResponse.self, endpoint: .version, identifier: name)
            return Version(apiModel: response)
        },
        fetchVersionList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .version,
                limit: limit,
                offset: offset
            )
            return response.results.map { VersionName(rawValue: $0.name) }
        },
        fetchVersionGroup: { name in
            let response = try await NetworkManager.shared.fetch(
                VersionGroupResponse.self,
                endpoint: .versionGroup,
                identifier: name
            )
            return VersionGroup(apiModel: response)
        },
        fetchVersionGroupList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .versionGroup,
                limit: limit,
                offset: offset
            )
            return response.results.map { VersionGroupName(rawValue: $0.name) }
        },
        fetchItem: { name in
            let response = try await NetworkManager.shared.fetch(ItemResponse.self, endpoint: .item, identifier: name)
            return Item(apiModel: response)
        },
        fetchItemList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .item,
                limit: limit,
                offset: offset
            )
            return response.results.map { ItemName(rawValue: $0.name) }
        },
        fetchItemAttribute: { name in
            let response = try await NetworkManager.shared.fetch(
                ItemAttributeResponse.self,
                endpoint: .itemAttribute,
                identifier: name
            )
            return ItemAttribute(apiModel: response)
        },
        fetchItemAttributeList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .itemAttribute,
                limit: limit,
                offset: offset
            )
            return response.results.map { ItemAttributeName(rawValue: $0.name) }
        },
        fetchItemCategory: { name in
            let response = try await NetworkManager.shared.fetch(
                ItemCategoryResponse.self,
                endpoint: .itemCategory,
                identifier: name
            )
            return ItemCategory(apiModel: response)
        },
        fetchItemCategoryList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .itemCategory,
                limit: limit,
                offset: offset
            )
            return response.results.map { ItemCategoryName(rawValue: $0.name) }
        },
        fetchItemFlingEffect: { name in
            let response = try await NetworkManager.shared.fetch(
                ItemFlingEffectResponse.self,
                endpoint: .itemFlingEffect,
                identifier: name
            )
            return ItemFlingEffect(apiModel: response)
        },
        fetchItemFlingEffectList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .itemFlingEffect,
                limit: limit,
                offset: offset
            )
            return response.results.map { ItemFlingEffectName(rawValue: $0.name) }
        },
        fetchItemPocket: { name in
            let response = try await NetworkManager.shared.fetch(ItemPocketResponse.self, endpoint: .itemPocket, identifier: name)
            return ItemPocket(apiModel: response)
        },
        fetchItemPocketList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .itemPocket,
                limit: limit,
                offset: offset
            )
            return response.results.map { ItemPocketName(rawValue: $0.name) }
        },
        fetchLocation: { name in
            let response = try await NetworkManager.shared.fetch(LocationResponse.self, endpoint: .location, identifier: name)
            return Location(apiModel: response)
        },
        fetchLocationList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .location,
                limit: limit,
                offset: offset
            )
            return response.results.map { LocationName(rawValue: $0.name) }
        },
        fetchLocationArea: { name in
            let response = try await NetworkManager.shared.fetch(
                LocationAreaResponse.self,
                endpoint: .locationArea,
                identifier: name
            )
            return LocationArea(apiModel: response)
        },
        fetchLocationAreaList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .locationArea,
                limit: limit,
                offset: offset
            )
            return response.results.map { LocationAreaName(rawValue: $0.name) }
        },
        fetchPalParkArea: { name in
            let response = try await NetworkManager.shared.fetch(
                PalParkAreaResponse.self,
                endpoint: .palParkArea,
                identifier: name
            )
            return PalParkArea(apiModel: response)
        },
        fetchPalParkAreaList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .palParkArea,
                limit: limit,
                offset: offset
            )
            return response.results.map { PalParkAreaName(rawValue: $0.name) }
        },
        fetchRegion: { name in
            let response = try await NetworkManager.shared.fetch(RegionResponse.self, endpoint: .region, identifier: name)
            return Region(apiModel: response)
        },
        fetchRegionList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .region,
                limit: limit,
                offset: offset
            )
            return response.results.map { RegionName(rawValue: $0.name) }
        },
        fetchMachine: { id in
            let response = try await NetworkManager.shared.fetch(MachineResponse.self, endpoint: .machine, identifier: id)
            return Machine(apiModel: response)
        },
        fetchMachineList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                APIResourceListResponse.self,
                endpoint: .machine,
                limit: limit,
                offset: offset
            )
            return response.results.map { MachineID(rawValue: $0.url.extractID()) }
        },
        fetchMove: { name in
            let response = try await NetworkManager.shared.fetch(MoveResponse.self, endpoint: .move, identifier: name)
            return Move(apiModel: response)
        },
        fetchMoveList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .move,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveName(rawValue: $0.name) }
        },
        fetchMoveAilment: { name in
            let response = try await NetworkManager.shared.fetch(
                MoveAilmentResponse.self,
                endpoint: .moveAilment,
                identifier: name
            )
            return MoveAilment(apiModel: response)
        },
        fetchMoveAilmentList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .moveAilment,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveAilmentName(rawValue: $0.name) }
        },
        fetchMoveBattleStyle: { name in
            let response = try await NetworkManager.shared.fetch(
                MoveBattleStyleResponse.self,
                endpoint: .moveBattleStyle,
                identifier: name
            )
            return MoveBattleStyle(apiModel: response)
        },
        fetchMoveBattleStyleList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .moveBattleStyle,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveBattleStyleName(rawValue: $0.name) }
        },
        fetchMoveCategory: { name in
            let response = try await NetworkManager.shared.fetch(
                MoveCategoryResponse.self,
                endpoint: .moveCategory,
                identifier: name
            )
            return MoveCategory(apiModel: response)
        },
        fetchMoveCategoryList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .moveCategory,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveCategoryName(rawValue: $0.name) }
        },
        fetchMoveDamageClass: { name in
            let response = try await NetworkManager.shared.fetch(
                MoveDamageClassResponse.self,
                endpoint: .moveDamageClass,
                identifier: name
            )
            return MoveDamageClass(apiModel: response)
        },
        fetchMoveDamageClassList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .moveDamageClass,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveDamageClassName(rawValue: $0.name) }
        },
        fetchMoveLearnMethod: { name in
            let response = try await NetworkManager.shared.fetch(
                MoveLearnMethodResponse.self,
                endpoint: .moveLearnMethod,
                identifier: name
            )
            return MoveLearnMethod(apiModel: response)
        },
        fetchMoveLearnMethodList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .moveLearnMethod,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveLearnMethodName(rawValue: $0.name) }
        },
        fetchMoveTarget: { name in
            let response = try await NetworkManager.shared.fetch(MoveTargetResponse.self, endpoint: .moveTarget, identifier: name)
            return MoveTarget(apiModel: response)
        },
        fetchMoveTargetList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .moveTarget,
                limit: limit,
                offset: offset
            )
            return response.results.map { MoveTargetName(rawValue: $0.name) }
        },
        fetchAbility: { name in
            let response = try await NetworkManager.shared.fetch(AbilityResponse.self, endpoint: .ability, identifier: name)
            return Ability(apiModel: response)
        },
        fetchAbilityList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .ability,
                limit: limit,
                offset: offset
            )
            return response.results.map { AbilityName(rawValue: $0.name) }
        },
        fetchCharacteristic: { id in
            let response = try await NetworkManager.shared.fetch(
                CharacteristicResponse.self,
                endpoint: .characteristic,
                identifier: id
            )
            return Characteristic(apiModel: response)
        },
        fetchCharacteristicList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                APIResourceListResponse.self,
                endpoint: .characteristic,
                limit: limit,
                offset: offset
            )
            return response.results.map { CharacteristicID(rawValue: $0.url.extractID()) }
        },
        fetchEggGroup: { name in
            let response = try await NetworkManager.shared.fetch(EggGroupResponse.self, endpoint: .eggGroup, identifier: name)
            return EggGroup(apiModel: response)
        },
        fetchEggGroupList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .eggGroup,
                limit: limit,
                offset: offset
            )
            return response.results.map { EggGroupName(rawValue: $0.name) }
        },
        fetchGender: { name in
            let response = try await NetworkManager.shared.fetch(GenderResponse.self, endpoint: .gender, identifier: name)
            return Gender(apiModel: response)
        },
        fetchGenderList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .gender,
                limit: limit,
                offset: offset
            )
            return response.results.map { GenderName(rawValue: $0.name) }
        },
        fetchGrowthRate: { name in
            let response = try await NetworkManager.shared.fetch(GrowthRateResponse.self, endpoint: .growthRate, identifier: name)
            return GrowthRate(apiModel: response)
        },
        fetchGrowthRateList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .growthRate,
                limit: limit,
                offset: offset
            )
            return response.results.map { GrowthRateName(rawValue: $0.name) }
        },
        fetchNature: { name in
            let response = try await NetworkManager.shared.fetch(NatureResponse.self, endpoint: .nature, identifier: name)
            return Nature(apiModel: response)
        },
        fetchNatureList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .nature,
                limit: limit,
                offset: offset
            )
            return response.results.map { NatureName(rawValue: $0.name) }
        },
        fetchPokeathlonStat: { name in
            let response = try await NetworkManager.shared.fetch(
                PokeathlonStatResponse.self,
                endpoint: .pokeathlonStat,
                identifier: name
            )
            return PokeathlonStat(apiModel: response)
        },
        fetchPokeathlonStatList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokeathlonStat,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokeathlonStatName(rawValue: $0.name) }
        },
        fetchPokemon: { name in
            let response = try await NetworkManager.shared.fetch(PokemonResponse.self, endpoint: .pokemon, identifier: name)
            return Pokemon(apiModel: response)
        },
        fetchPokemonList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokemon,
                limit: limit,
                offset: offset
            )
            return response.results.map {
                PokemonListIdentifier(id: $0.url.listID(), name: PokemonName(rawValue: $0.name))
            }
        },
        fetchPokemonColor: { name in
            let response = try await NetworkManager.shared.fetch(
                PokemonColorResponse.self,
                endpoint: .pokemonColor,
                identifier: name
            )
            return PokemonColor(apiModel: response)
        },
        fetchPokemonColorList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokemonColor,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokemonColorName(rawValue: $0.name) }
        },
        fetchPokemonForm: { name in
            let response = try await NetworkManager.shared.fetch(
                PokemonFormResponse.self,
                endpoint: .pokemonForm,
                identifier: name
            )
            return PokemonForm(apiModel: response)
        },
        fetchPokemonFormList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokemonForm,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokemonFormName(rawValue: $0.name) }
        },
        fetchPokemonHabitat: { name in
            let response = try await NetworkManager.shared.fetch(
                PokemonHabitatResponse.self,
                endpoint: .pokemonHabitat,
                identifier: name
            )
            return PokemonHabitat(apiModel: response)
        },
        fetchPokemonHabitatList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokemonHabitat,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokemonHabitatName(rawValue: $0.name) }
        },
        fetchPokemonShape: { name in
            let response = try await NetworkManager.shared.fetch(
                PokemonShapeResponse.self,
                endpoint: .pokemonShape,
                identifier: name
            )
            return PokemonShape(apiModel: response)
        },
        fetchPokemonShapeList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokemonShape,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokemonShapeName(rawValue: $0.name) }
        },
        fetchPokemonSpecies: { name in
            let response = try await NetworkManager.shared.fetch(
                PokemonSpeciesResponse.self,
                endpoint: .pokemonSpecies,
                identifier: name
            )
            return PokemonSpecies(apiModel: response)
        },
        fetchPokemonSpeciesList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .pokemonSpecies,
                limit: limit,
                offset: offset
            )
            return response.results.map { PokemonSpeciesName(rawValue: $0.name) }
        },
        fetchStat: { name in
            let response = try await NetworkManager.shared.fetch(StatResponse.self, endpoint: .stat, identifier: name)
            return Stat(apiModel: response)
        },
        fetchStatList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .stat,
                limit: limit,
                offset: offset
            )
            return response.results.map { StatName(rawValue: $0.name) }
        },
        fetchType: { name in
            let response = try await NetworkManager.shared.fetch(TypeResponse.self, endpoint: .type, identifier: name)
            return PokemonType(apiModel: response)
        },
        fetchTypeList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .type,
                limit: limit,
                offset: offset
            )
            return response.results.map { TypeName(rawValue: $0.name) }
        },
        fetchLanguageList: { limit, offset in
            let response = try await NetworkManager.shared.fetchList(
                NamedAPIResourceListResponse.self,
                endpoint: .language,
                limit: limit,
                offset: offset
            )
            return response.results.map { LanguageName(rawValue: $0.name) }
        }
    )
}

extension APIClient: TestDependencyKey {
    public static let testValue = Self()
}

extension DependencyValues {
    public var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}

extension URL {
    public func listID() -> String {
        let components = pathComponents
        guard let id = components.last else {
            fatalError("Failed to extract id: \(components.joined(separator: "/"))")
        }

        return id
    }
}
