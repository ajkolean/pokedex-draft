import Foundation

// Domain model for Ability
public struct Ability: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: AbilityName
    public let isMainSeries: Bool
    public let generation: GenerationName
    public let names: [Name]
    public let effectEntries: [VerboseEffect]
    public let effectChanges: [EffectChange]
    public let flavorTextEntries: [FlavorText]
    public let pokemon: [AbilityPokemon]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
    
    public struct VerboseEffect: Codable, Hashable {
        public let effect: String
        public let shortEffect: String
        public let language: LanguageName
    }
    
    public struct EffectChange: Codable, Hashable {
        public let versionGroup: VersionGroupName
        public let effectEntries: [VerboseEffect]
    }
    
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
        public let versionGroup: VersionGroupName
    }
    
    public struct AbilityPokemon: Codable, Hashable {
        public let isHidden: Bool
        public let slot: Int
        public let pokemon: PokemonName
    }
}

extension Ability {
    init(apiModel: AbilityResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.isMainSeries = apiModel.is_main_series
        self.generation = GenerationName(rawValue: apiModel.generation.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.effectEntries = apiModel.effect_entries.map { VerboseEffect(effect: $0.effect, shortEffect: $0.short_effect, language: LanguageName(rawValue: $0.language.name)) }
        self.effectChanges = apiModel.effect_changes.map { EffectChange(versionGroup: VersionGroupName(rawValue: $0.version_group.name), effectEntries: $0.effect_entries.map { VerboseEffect(effect: $0.effect, shortEffect: $0.short_effect, language: LanguageName(rawValue: $0.language.name)) }) }
        self.flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(flavorText: $0.flavor_text, language: LanguageName(rawValue: $0.language.name), versionGroup: VersionGroupName(rawValue: $0.version_group.name)) }
        self.pokemon = apiModel.pokemon.map { AbilityPokemon(isHidden: $0.is_hidden, slot: $0.slot, pokemon: PokemonName(rawValue: $0.pokemon.name)) }
    }
}

// Domain model for Characteristic
public struct Characteristic: Codable, Hashable, Identifiable {
    public let id: CharacteristicID
    public let geneModulo: Int
    public let possibleValues: [Int]
    public let highestStat: StatName
    public let descriptions: [Description]
    
    public struct Description: Codable, Hashable {
        public let description: String
        public let language: LanguageName
    }
}

extension Characteristic {
    init(apiModel: CharacteristicResponse) {
        self.id = apiModel.id
        self.geneModulo = apiModel.gene_modulo
        self.possibleValues = apiModel.possible_values
        self.highestStat = StatName(rawValue: apiModel.highest_stat.name)
        self.descriptions = apiModel.descriptions.map { Description(description: $0.description, language: LanguageName(rawValue: $0.language.name)) }
    }
}

// Domain model for EggGroup
public struct EggGroup: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EggGroupName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension EggGroup {
    init(apiModel: EggGroupResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}

// Domain model for Gender
public struct Gender: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: GenderName
    public let pokemonSpeciesDetails: [PokemonSpeciesGender]
    public let requiredForEvolution: [PokemonSpeciesName]
    
    public struct PokemonSpeciesGender: Codable, Hashable {
        public let rate: Int
        public let pokemonSpecies: PokemonSpeciesName
    }
}

extension Gender {
    init(apiModel: GenderResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.pokemonSpeciesDetails = apiModel.pokemon_species_details.map { PokemonSpeciesGender(rate: $0.rate, pokemonSpecies: PokemonSpeciesName(rawValue: $0.pokemon_species.name)) }
        self.requiredForEvolution = apiModel.required_for_evolution.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}

// Domain model for GrowthRate
public struct GrowthRate: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: GrowthRateName
    public let formula: String
    public let descriptions: [Description]
    public let levels: [ExperienceLevel]
    public let pokemonSpecies: [PokemonSpeciesName]
    
    public struct Description: Codable, Hashable {
        public let description: String
        public let language: LanguageName
    }
    
    public struct ExperienceLevel: Codable, Hashable {
        public let level: Int
        public let experience: Int
    }
}

extension GrowthRate {
    init(apiModel: GrowthRateResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.formula = apiModel.formula
        self.descriptions = apiModel.descriptions.map { Description(description: $0.description, language: LanguageName(rawValue: $0.language.name)) }
        self.levels = apiModel.levels.map { ExperienceLevel(level: $0.level, experience: $0.experience) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}

// Domain model for Nature
public struct Nature: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: NatureName
    public let decreasedStat: StatName
    public let increasedStat: StatName
    public let hatesFlavor: BerryFlavorName
    public let likesFlavor: BerryFlavorName
    public let pokeathlonStatChanges: [StatChange]
    public let moveBattleStylePreferences: [MoveBattleStylePreference]
    public let names: [Name]
    
    public struct StatChange: Codable, Hashable {
        public let maxChange: Int
        public let pokeathlonStat: PokeathlonStatName
    }
    
    public struct MoveBattleStylePreference: Codable, Hashable {
        public let lowHPPreference: Int
        public let highHPPreference: Int
        public let moveBattleStyle: MoveBattleStyleName
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension Nature {
    init(apiModel: NatureResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.decreasedStat = StatName(rawValue: apiModel.decreased_stat.name)
        self.increasedStat = StatName(rawValue: apiModel.increased_stat.name)
        self.hatesFlavor = BerryFlavorName(rawValue: apiModel.hates_flavor.name)
        self.likesFlavor = BerryFlavorName(rawValue: apiModel.likes_flavor.name)
        self.pokeathlonStatChanges = apiModel.pokeathlon_stat_changes.map { StatChange(maxChange: $0.max_change, pokeathlonStat: PokeathlonStatName(rawValue: $0.pokeathlon_stat.name)) }
        self.moveBattleStylePreferences = apiModel.move_battle_style_preferences.map { MoveBattleStylePreference(lowHPPreference: $0.low_hp_preference, highHPPreference: $0.high_hp_preference, moveBattleStyle: MoveBattleStyleName(rawValue: $0.move_battle_style.name)) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

// Domain model for PokeathlonStat
public struct PokeathlonStat: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokeathlonStatName
    public let names: [Name]
    public let affectingNatures: AffectingNatures
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
    
    public struct AffectingNatures: Codable, Hashable {
        public let increase: [NatureStatChange]
        public let decrease: [NatureStatChange]
        
        public struct NatureStatChange: Codable, Hashable {
            public let maxChange: Int
            public let nature: NatureName
        }
    }
}

extension PokeathlonStat {
    init(apiModel: PokeathlonStatResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.affectingNatures = AffectingNatures(increase: apiModel.affecting_natures.increase.map { AffectingNatures.NatureStatChange(maxChange: $0.max_change, nature: NatureName(rawValue: $0.nature.name)) }, decrease: apiModel.affecting_natures.decrease.map { AffectingNatures.NatureStatChange(maxChange: $0.max_change, nature: NatureName(rawValue: $0.nature.name)) })
    }
}

// Domain model for Pokemon
public struct Pokemon: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonName
    public let baseExperience: Int
    public let height: Int
    public let isDefault: Bool
    public let order: Int
    public let weight: Int
    public let abilities: [Ability]
    public let forms: [PokemonFormName]
    public let gameIndices: [GameIndex]
    public let heldItems: [HeldItem]
    public let locationAreaEncounters: String
    public let moves: [Move]
    public let pastTypes: [PastType]
    public let sprites: Sprites
    public let cries: Cries
    public let species: PokemonSpeciesName
    public let stats: [Stat]
    public let types: [TypeSlot]
    
    public struct Ability: Codable, Hashable {
        public let isHidden: Bool
        public let slot: Int
        public let ability: AbilityName
    }
    
    public struct GameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let version: VersionName
    }
    
    public struct HeldItem: Codable, Hashable {
        public let item: ItemName
        public let versionDetails: [VersionDetail]
        
        public struct VersionDetail: Codable, Hashable {
            public let version: VersionName
            public let rarity: Int
        }
    }
    
    public struct Move: Codable, Hashable {
        public let move: MoveName
        public let versionGroupDetails: [VersionGroupDetail]
        
        public struct VersionGroupDetail: Codable, Hashable {
            public let moveLearnMethod: MoveLearnMethodName
            public let versionGroup: VersionGroupName
            public let levelLearnedAt: Int
        }
    }
    
    public struct PastType: Codable, Hashable {
        public let generation: GenerationName
        public let types: [TypeSlot]
    }
    
    public struct Sprites: Codable, Hashable {
        public let backDefault: String?
        public let backFemale: String?
        public let backShiny: String?
        public let backShinyFemale: String?
        public let frontDefault: String?
        public let frontFemale: String?
        public let frontShiny: String?
        public let frontShinyFemale: String?
    }
    
    public struct Cries: Codable, Hashable {
        public let latest: String
        public let legacy: String
    }
    
    public struct Stat: Codable, Hashable {
        public let baseStat: Int
        public let effort: Int
        public let stat: StatName
    }
    
    public struct TypeSlot: Codable, Hashable {
        public let slot: Int
        public let type: TypeName
    }
}

extension Pokemon {
    init(apiModel: PokemonResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.baseExperience = apiModel.base_experience
        self.height = apiModel.height
        self.isDefault = apiModel.is_default
        self.order = apiModel.order
        self.weight = apiModel.weight
        self.abilities = apiModel.abilities.map { Ability(isHidden: $0.is_hidden, slot: $0.slot, ability: AbilityName(rawValue: $0.ability.name)) }
        self.forms = apiModel.forms.map { PokemonFormName(rawValue: $0.name) }
        self.gameIndices = apiModel.game_indices.map { GameIndex(gameIndex: $0.game_index, version: VersionName(rawValue: $0.version.name)) }
        self.heldItems = apiModel.held_items.map { HeldItem(item: ItemName(rawValue: $0.item.name), versionDetails: $0.version_details.map { HeldItem.VersionDetail(version: VersionName(rawValue: $0.version.name), rarity: $0.rarity) }) }
        self.locationAreaEncounters = apiModel.location_area_encounters
        self.moves = apiModel.moves.map { Move(move: MoveName(rawValue: $0.move.name), versionGroupDetails: $0.version_group_details.map { Move.VersionGroupDetail(moveLearnMethod: MoveLearnMethodName(rawValue: $0.move_learn_method.name), versionGroup: VersionGroupName(rawValue: $0.version_group.name), levelLearnedAt: $0.level_learned_at) }) }
        self.pastTypes = apiModel.past_types.map { PastType(generation: GenerationName(rawValue: $0.generation.name), types: $0.types.map { TypeSlot(slot: $0.slot, type: TypeName(rawValue: $0.type.name)) }) }
        self.sprites = Sprites(backDefault: apiModel.sprites.back_default, backFemale: apiModel.sprites.back_female, backShiny: apiModel.sprites.back_shiny, backShinyFemale: apiModel.sprites.back_shiny_female, frontDefault: apiModel.sprites.front_default, frontFemale: apiModel.sprites.front_female, frontShiny: apiModel.sprites.front_shiny, frontShinyFemale: apiModel.sprites.front_shiny_female)
        self.cries = Cries(latest: apiModel.cries.latest, legacy: apiModel.cries.legacy)
        self.species = PokemonSpeciesName(rawValue: apiModel.species.name)
        self.stats = apiModel.stats.map { Stat(baseStat: $0.base_stat, effort: $0.effort, stat: StatName(rawValue: $0.stat.name)) }
        self.types = apiModel.types.map { TypeSlot(slot: $0.slot, type: TypeName(rawValue: $0.type.name)) }
    }
}

// Domain model for PokemonColor
public struct PokemonColor: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonColorName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension PokemonColor {
    init(apiModel: PokemonColorResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}

// Domain model for PokemonForm
public struct PokemonForm: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonFormName
    public let order: Int
    public let formOrder: Int
    public let isDefault: Bool
    public let isBattleOnly: Bool
    public let isMega: Bool
    public let formName: String
    public let pokemon: PokemonName
    public let types: [TypeSlot]
    public let sprites: Sprites
    public let versionGroup: VersionGroupName
    public let names: [Name]
    public let formNames: [FormName]
    
    public struct TypeSlot: Codable, Hashable {
        public let slot: Int
        public let type: TypeName
    }
    
    public struct Sprites: Codable, Hashable {
        public let backDefault: String?
        public let backFemale: String?
        public let backShiny: String?
        public let backShinyFemale: String?
        public let frontDefault: String?
        public let frontFemale: String?
        public let frontShiny: String?
        public let frontShinyFemale: String?
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
    
    public struct FormName: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension PokemonForm {
    init(apiModel: PokemonFormResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.order = apiModel.order
        self.formOrder = apiModel.form_order
        self.isDefault = apiModel.is_default
        self.isBattleOnly = apiModel.is_battle_only
        self.isMega = apiModel.is_mega
        self.formName = apiModel.form_name
        self.pokemon = PokemonName(rawValue: apiModel.pokemon.name)
        self.types = apiModel.types.map { TypeSlot(slot: $0.slot, type: TypeName(rawValue: $0.type.name)) }
        self.sprites = Sprites(backDefault: apiModel.sprites.back_default, backFemale: apiModel.sprites.back_female, backShiny: apiModel.sprites.back_shiny, backShinyFemale: apiModel.sprites.back_shiny_female, frontDefault: apiModel.sprites.front_default, frontFemale: apiModel.sprites.front_female, frontShiny: apiModel.sprites.front_shiny, frontShinyFemale: apiModel.sprites.front_shiny_female)
        self.versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.formNames = apiModel.form_names.map { FormName(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

// Domain model for PokemonHabitat
public struct PokemonHabitat: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonHabitatName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension PokemonHabitat {
    init(apiModel: PokemonHabitatResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}

// Domain model for PokemonShape
public struct PokemonShape: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonShapeName
    public let awesomeNames: [AwesomeName]
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
    
    public struct AwesomeName: Codable, Hashable {
        public let awesomeName: String
        public let language: LanguageName
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension PokemonShape {
    init(apiModel: PokemonShapeResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.awesomeNames = apiModel.awesome_names.map { AwesomeName(awesomeName: $0.awesome_name, language: LanguageName(rawValue: $0.language.name)) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
    }
}

// Domain model for PokemonSpecies
public struct PokemonSpecies: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonSpeciesName
    public let order: Int
    public let genderRate: Int
    public let captureRate: Int
    public let baseHappiness: Int
    public let isBaby: Bool
    public let isLegendary: Bool
    public let isMythical: Bool
    public let hatchCounter: Int
    public let hasGenderDifferences: Bool
    public let formsSwitchable: Bool
    public let growthRate: GrowthRateName
    public let pokedexNumbers: [PokedexNumber]
    public let eggGroups: [EggGroupName]
    public let color: PokemonColorName
    public let shape: PokemonShapeName
    public let evolvesFromSpecies: PokemonSpeciesName?
    public let evolutionChain: URL
    public let habitat: PokemonHabitatName?
    public let generation: GenerationName
    public let names: [Name]
    public let palParkEncounters: [PalParkEncounter]
    public let flavorTextEntries: [FlavorText]
    public let formDescriptions: [Description]
    public let genera: [Genus]
    public let varieties: [Variety]
    
    public struct PokedexNumber: Codable, Hashable {
        public let entryNumber: Int
        public let pokedex: PokedexName
    }
    
    public struct PalParkEncounter: Codable, Hashable {
        public let baseScore: Int
        public let rate: Int
        public let area: PalParkAreaName
    }
    
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
        public let version: VersionName
    }
    
    public struct Description: Codable, Hashable {
        public let description: String
        public let language: LanguageName
    }
    
    public struct Genus: Codable, Hashable {
        public let genus: String
        public let language: LanguageName
    }
    
    public struct Variety: Codable, Hashable {
        public let isDefault: Bool
        public let pokemon: PokemonName
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension PokemonSpecies {
    init(apiModel: PokemonSpeciesResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.order = apiModel.order
        self.genderRate = apiModel.gender_rate
        self.captureRate = apiModel.capture_rate
        self.baseHappiness = apiModel.base_happiness
        self.isBaby = apiModel.is_baby
        self.isLegendary = apiModel.is_legendary
        self.isMythical = apiModel.is_mythical
        self.hatchCounter = apiModel.hatch_counter
        self.hasGenderDifferences = apiModel.has_gender_differences
        self.formsSwitchable = apiModel.forms_switchable
        self.growthRate = GrowthRateName(rawValue: apiModel.growth_rate.name)
        self.pokedexNumbers = apiModel.pokedex_numbers.map { PokedexNumber(entryNumber: $0.entry_number, pokedex: PokedexName(rawValue: $0.pokedex.name)) }
        self.eggGroups = apiModel.egg_groups.map { EggGroupName(rawValue: $0.name) }
        self.color = PokemonColorName(rawValue: apiModel.color.name)
        self.shape = PokemonShapeName(rawValue: apiModel.shape.name)
        self.evolvesFromSpecies = nil //apiModel.evolves_from_species?.name.map(PokemonSpeciesName.init(rawValue:))
        self.evolutionChain = apiModel.evolution_chain.url
        self.habitat = nil //apiModel.habitat?.name.map { PokemonHabitatName.init(rawValue: $0) }
        self.generation = GenerationName(rawValue: apiModel.generation.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.palParkEncounters = apiModel.pal_park_encounters.map { PalParkEncounter(baseScore: $0.base_score, rate: $0.rate, area: PalParkAreaName(rawValue: $0.area.name)) }
        self.flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(flavorText: $0.flavor_text, language: LanguageName(rawValue: $0.language.name), version: VersionName(rawValue: $0.version.name)) }
        self.formDescriptions = apiModel.form_descriptions.map { Description(description: $0.description, language: LanguageName(rawValue: $0.language.name)) }
        self.genera = apiModel.genera.map { Genus(genus: $0.genus, language: LanguageName(rawValue: $0.language.name)) }
        self.varieties = apiModel.varieties.map { Variety(isDefault: $0.is_default, pokemon: PokemonName(rawValue: $0.pokemon.name)) }
    }
}

// Domain model for Stat
public struct Stat: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: StatName
    public let gameIndex: Int
    public let isBattleOnly: Bool
    public let affectingMoves: AffectingMoves
    public let affectingNatures: AffectingNatures
    public let characteristics: [URL]
    public let moveDamageClass: MoveDamageClassName
    public let names: [Name]
    
    public struct AffectingMoves: Codable, Hashable {
        public let increase: [MoveStatChange]
        public let decrease: [MoveStatChange]
        
        public struct MoveStatChange: Codable, Hashable {
            public let change: Int
            public let move: MoveName
        }
    }
    
    public struct AffectingNatures: Codable, Hashable {
        public let increase: [NatureName]
        public let decrease: [NatureName]
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension Stat {
    init(apiModel: StatResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.gameIndex = apiModel.game_index
        self.isBattleOnly = apiModel.is_battle_only
        self.affectingMoves = AffectingMoves(increase: apiModel.affecting_moves.increase.map { AffectingMoves.MoveStatChange(change: $0.change, move: MoveName(rawValue: $0.move.name)) }, decrease: apiModel.affecting_moves.decrease.map { AffectingMoves.MoveStatChange(change: $0.change, move: MoveName(rawValue: $0.move.name)) })
        self.affectingNatures = AffectingNatures(increase: apiModel.affecting_natures.increase.map { NatureName(rawValue: $0.name) }, decrease: apiModel.affecting_natures.decrease.map { NatureName(rawValue: $0.name) })
        self.characteristics = apiModel.characteristics.map { $0.url }
        self.moveDamageClass = MoveDamageClassName(rawValue: apiModel.move_damage_class.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

// Domain model for Type
public struct PokemonType: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: TypeName
    public let damageRelations: DamageRelations
    public let pastDamageRelations: [PastDamageRelations]
    public let gameIndices: [GameIndex]
    public let generation: GenerationName
    public let moveDamageClass: MoveDamageClassName
    public let names: [Name]
    public let pokemon: [TypePokemon]
    public let moves: [MoveName]
    
    public struct DamageRelations: Codable, Hashable {
        public let noDamageTo: [TypeName]
        public let halfDamageTo: [TypeName]
        public let doubleDamageTo: [TypeName]
        public let noDamageFrom: [TypeName]
        public let halfDamageFrom: [TypeName]
        public let doubleDamageFrom: [TypeName]
    }
    
    public struct PastDamageRelations: Codable, Hashable {
        public let generation: GenerationName
        public let damageRelations: DamageRelations
    }
    
    public struct GameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let generation: GenerationName
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
    
    public struct TypePokemon: Codable, Hashable {
        public let slot: Int
        public let pokemon: PokemonName
    }
}

extension PokemonType {
    init(apiModel: TypeResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.damageRelations = DamageRelations(noDamageTo: apiModel.damage_relations.no_damage_to.map { TypeName(rawValue: $0.name) }, halfDamageTo: apiModel.damage_relations.half_damage_to.map { TypeName(rawValue: $0.name) }, doubleDamageTo: apiModel.damage_relations.double_damage_to.map { TypeName(rawValue: $0.name) }, noDamageFrom: apiModel.damage_relations.no_damage_from.map { TypeName(rawValue: $0.name) }, halfDamageFrom: apiModel.damage_relations.half_damage_from.map { TypeName(rawValue: $0.name) }, doubleDamageFrom: apiModel.damage_relations.double_damage_from.map { TypeName(rawValue: $0.name) })
        self.pastDamageRelations = apiModel.past_damage_relations.map { PastDamageRelations(generation: GenerationName(rawValue: $0.generation.name), damageRelations: DamageRelations(noDamageTo: $0.damage_relations.no_damage_to.map { TypeName(rawValue: $0.name) }, halfDamageTo: $0.damage_relations.half_damage_to.map { TypeName(rawValue: $0.name) }, doubleDamageTo: $0.damage_relations.double_damage_to.map { TypeName(rawValue: $0.name) }, noDamageFrom: $0.damage_relations.no_damage_from.map { TypeName(rawValue: $0.name) }, halfDamageFrom: $0.damage_relations.half_damage_from.map { TypeName(rawValue: $0.name) }, doubleDamageFrom: $0.damage_relations.double_damage_from.map { TypeName(rawValue: $0.name) })) }
        self.gameIndices = apiModel.game_indices.map { GameIndex(gameIndex: $0.game_index, generation: GenerationName(rawValue: $0.generation.name)) }
        self.generation = GenerationName(rawValue: apiModel.generation.name)
        self.moveDamageClass = MoveDamageClassName(rawValue: apiModel.move_damage_class.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pokemon = apiModel.pokemon.map { TypePokemon(slot: $0.slot, pokemon: PokemonName(rawValue: $0.pokemon.name)) }
        self.moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
    }
}
