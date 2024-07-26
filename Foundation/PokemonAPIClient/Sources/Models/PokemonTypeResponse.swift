import Foundation


struct AbilityEffectChangeResponse: Codable {
    /// The version group in which the effect of this ability change.
    let version_group: NamedAPIResource
    /// The list of previous effects this ability has had across version groups.
    let effect_entries: [VerboseEffectResponse]
}

struct AbilityFlavorTextResponse: Codable {
    /// The localized flavor text for an API resource in a specific language.
    let flavor_text: String
    /// The language this name is in.
    let language: NamedAPIResource
    /// The version group that uses this flavor text.
    let version_group: NamedAPIResource
}

struct AbilityPokemonResponse: Codable {
    /// Whether or not this a hidden ability.
    let is_hidden: Bool
    /// The slot this ability occupies in this Pokémon species.
    let slot: Int
    /// The Pokémon that could potentially have this ability.
    let pokemon: NamedAPIResource
}

struct AbilityResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: AbilityName
    /// Whether or not this ability originated in the main series of the video games.
    let is_main_series: Bool
    /// The generation this ability originated in.
    let generation: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// The effect of this ability listed in different languages.
    let effect_entries: [VerboseEffectResponse]
    /// The list of previous effects this ability has had across version groups.
    let effect_changes: [AbilityEffectChangeResponse]
    /// The flavor text of this ability listed in different languages.
    let flavor_text_entries: [AbilityFlavorTextResponse]
    /// A list of Pokémon that could potentially have this ability.
    let pokemon: [AbilityPokemonResponse]
}

struct CharacteristicResponse: Codable {
    /// The identifier for this resource.
    let id: CharacteristicID
    /// The gene modulo.
    let gene_modulo: Int
    /// The possible values.
    let possible_values: [Int]
    /// The highest stat.
    let highest_stat: NamedAPIResource
    /// The descriptions of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
}

struct EggGroupResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: EggGroupName
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon species that are members of this egg group.
    let pokemon_species: [NamedAPIResource]
}

struct PokemonSpeciesGenderResponse: Codable {
    /// The rate for this Pokémon species.
    let rate: Int
    /// The Pokémon species.
    let pokemon_species: NamedAPIResource
}

struct GenderResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: GenderName
    /// A list of Pokémon species details.
    let pokemon_species_details: [PokemonSpeciesGenderResponse]
    /// A list of Pokémon species that require this gender in order to evolve.
    let required_for_evolution: [NamedAPIResource]
}

struct GrowthRateExperienceLevelResponse: Codable {
    /// The level.
    let level: Int
    /// The amount of experience required to reach the referenced level.
    let experience: Int
}

struct GrowthRateResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: GrowthRateName
    /// The formula used to calculate the rate at which the Pokémon species gains level.
    let formula: String
    /// The descriptions of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
    /// A list of levels and the amount of experienced needed to at each.
    let levels: [GrowthRateExperienceLevelResponse]
    /// A list of Pokémon species that gain levels at this growth rate.
    let pokemon_species: [NamedAPIResource]
}

struct NatureStatChangeResponse: Codable {
    /// The maximum change.
    let max_change: Int
    /// The stat affected.
    let pokeathlon_stat: NamedAPIResource
}

struct MoveBattleStylePreferenceResponse: Codable {
    /// The preference of a move battle style for Pokémon with low HP.
    let low_hp_preference: Int
    /// The preference of a move battle style for Pokémon with high HP.
    let high_hp_preference: Int
    /// The move battle style.
    let move_battle_style: NamedAPIResource
}

struct NatureResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: NatureName
    /// The stat decreased by this nature.
    let decreased_stat: NamedAPIResource
    /// The stat increased by this nature.
    let increased_stat: NamedAPIResource
    /// The flavor hated by this nature.
    let hates_flavor: NamedAPIResource
    /// The flavor liked by this nature.
    let likes_flavor: NamedAPIResource
    /// A list of Pokéathlon stats this nature affects and how much it affects them.
    let pokeathlon_stat_changes: [NatureStatChangeResponse]
    /// A list of battle styles and how likely a Pokémon with this nature is to use them in the Battle Palace or Battle Tent.
    let move_battle_style_preferences: [MoveBattleStylePreferenceResponse]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

struct NaturePokeathlonStatAffectResponse: Codable {
    /// The maximum change.
    let max_change: Int
    /// The nature.
    let nature: NamedAPIResource
}

struct NaturePokeathlonStatAffectSetsResponse: Codable {
    /// A list of natures and how much they increase the referenced Pokéathlon stat.
    let increase: [NaturePokeathlonStatAffectResponse]
    /// A list of natures and how much they decrease the referenced Pokéathlon stat.
    let decrease: [NaturePokeathlonStatAffectResponse]
}

struct PokeathlonStatResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokeathlonStatName
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A detail of natures which affect this Pokéathlon stat positively or negatively.
    let affecting_natures: NaturePokeathlonStatAffectSetsResponse
}

struct PokemonAbilityResponse: Codable {
    /// Whether or not this a hidden ability.
    let is_hidden: Bool
    /// The slot this ability occupies in this Pokémon species.
    let slot: Int
    /// The ability the Pokémon may have.
    let ability: NamedAPIResource
}

struct PokemonHeldItemVersionResponse: Codable {
    /// The version in which the item is held.
    let version: NamedAPIResource
    /// How often this Pokémon holds this item in this version.
    let rarity: Int
}

struct PokemonHeldItemResponse: Codable {
    /// The item the referenced Pokémon holds.
    let item: NamedAPIResource
    /// The details of the different versions in which the item is held.
    let version_details: [PokemonHeldItemVersionResponse]
}

struct PokemonMoveVersionResponse: Codable {
    /// The method by which the move is learned.
    let move_learn_method: NamedAPIResource
    /// The version group in which the move is learned.
    let version_group: NamedAPIResource
    /// The minimum level to learn the move.
    let level_learned_at: Int
}

struct PokemonMoveResponse: Codable {
    /// The move the Pokémon can learn.
    let move: NamedAPIResource
    /// The details of the version in which the Pokémon can learn the move.
    let version_group_details: [PokemonMoveVersionResponse]
}

struct PokemonTypeResponse: Codable {
    /// The order the Pokémon's types are listed in.
    let slot: Int
    /// The type the referenced Pokémon has.
    let type: NamedAPIResource
}

struct PokemonTypePastResponse: Codable {
    /// The generation relevant to this Pokémon type.
    let generation: NamedAPIResource
    /// The types the referenced Pokémon had in previous generations.
    let types: [PokemonTypeResponse]
}

struct PokemonStatResponse: Codable {
    /// The base value of this stat.
    let base_stat: Int
    /// The effort points (EV) the Pokémon has in this stat.
    let effort: Int
    /// The stat the Pokémon has.
    let stat: NamedAPIResource
}

struct PokemonSpritesResponse: Codable {
    /// The default depiction of this Pokémon from the back in battle.
    let back_default: String?
    /// The female depiction of this Pokémon from the back in battle.
    let back_female: String?
    /// The shiny depiction of this Pokémon from the back in battle.
    let back_shiny: String?
    /// The shiny female depiction of this Pokémon from the back in battle.
    let back_shiny_female: String?
    /// The default depiction of this Pokémon from the front in battle.
    let front_default: String?
    /// The female depiction of this Pokémon from the front in battle.
    let front_female: String?
    /// The shiny depiction of this Pokémon from the front in battle.
    let front_shiny: String?
    /// The shiny female depiction of this Pokémon from the front in battle.
    let front_shiny_female: String?
}

struct PokemonCriesResponse: Codable {
    /// The latest cry sound of this Pokémon.
    let latest: String
    /// The legacy cry sound of this Pokémon.
    let legacy: String
}

struct PokemonResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokemonName
    /// The base experience gained for defeating this Pokémon.
    let base_experience: Int
    /// The height of this Pokémon in decimetres.
    let height: Int
    /// Whether or not this is the default depiction of this Pokémon.
    let is_default: Bool
    /// The order the Pokémon species is listed in.
    let order: Int
    /// The weight of this Pokémon in hectograms.
    let weight: Int
    /// A list of abilities this Pokémon could potentially have.
    let abilities: [PokemonAbilityResponse]
    /// A list of forms this Pokémon can take on.
    let forms: [NamedAPIResource]
    /// A list of game indices relevant to this Pokémon.
    let game_indices: [VersionGameIndexResponse]
    /// A list of items this Pokémon may be holding when encountered.
    let held_items: [PokemonHeldItemResponse]
    /// The URL for the location area encounters.
    let location_area_encounters: String
    /// A list of moves along with learn methods and level details pertaining to specific version groups.
    let moves: [PokemonMoveResponse]
    /// A list of details showing types this Pokémon had in previous generations.
    let past_types: [PokemonTypePastResponse]
    /// A set of sprites used to depict this Pokémon in the game.
    let sprites: PokemonSpritesResponse
    /// A set of cries used by this Pokémon.
    let cries: PokemonCriesResponse
    /// The Pokémon species this Pokémon is a part of.
    let species: NamedAPIResource
    /// A list of base stat values for this Pokémon.
    let stats: [PokemonStatResponse]
    /// A list of details showing types this Pokémon has.
    let types: [PokemonTypeResponse]
}


struct EncounterDetailResponse: Codable {
    /// The lowest level the Pokémon could be encountered at.
    let min_level: Int
    /// The highest level the Pokémon could be encountered at.
    let max_level: Int
    /// A list of condition values that must be in effect for this encounter to occur.
    let condition_values: [NamedAPIResource]
    /// The chance of an encounter to occur.
    let chance: Int
    /// The method by which the encounter happens.
    let method: NamedAPIResource
}

struct LocationAreaEncounterResponse: Codable {
    /// The location area the referenced Pokémon can be encountered in.
    let location_area: NamedAPIResource
    /// A list of versions and encounters with Pokémon that might happen in the referenced location area.
    let version_details: [VersionEncounterDetailResponse]
}

struct PokemonColorResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokemonColorName
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon species that have this color.
    let pokemon_species: [NamedAPIResource]
}

struct PokemonFormSpritesResponse: Codable {
    /// The default depiction of this Pokémon form from the back in battle.
    let back_default: String?
    /// The female depiction of this Pokémon form from the back in battle.
    let back_female: String?
    /// The shiny depiction of this Pokémon form from the back in battle.
    let back_shiny: String?
    /// The shiny female depiction of this Pokémon form from the back in battle.
    let back_shiny_female: String?
    /// The default depiction of this Pokémon form from the front in battle.
    let front_default: String?
    /// The female depiction of this Pokémon form from the front in battle.
    let front_female: String?
    /// The shiny depiction of this Pokémon form from the front in battle.
    let front_shiny: String?
    /// The shiny female depiction of this Pokémon form from the front in battle.
    let front_shiny_female: String?
}

struct PokemonFormResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokemonFormName
    /// The order in which forms should be sorted within all forms.
    let order: Int
    /// The order in which forms should be sorted within a species' forms.
    let form_order: Int
    /// Whether or not this is the default form of this Pokémon.
    let is_default: Bool
    /// Whether or not this form can only happen during battle.
    let is_battle_only: Bool
    /// Whether or not this form requires mega evolution.
    let is_mega: Bool
    /// The name of this form.
    let form_name: String
    /// The Pokémon that can take on this form.
    let pokemon: NamedAPIResource
    /// A list of types this form has.
    let types: [PokemonTypeResponse]
    /// A set of sprites used to depict this Pokémon form in the game.
    let sprites: PokemonFormSpritesResponse
    /// The version group this form was introduced in.
    let version_group: NamedAPIResource
    /// The name of this form listed in different languages.
    let names: [NameResponse]
    /// The form name listed in different languages.
    let form_names: [NameResponse]
}

struct PokemonHabitatResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokemonHabitatName
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon species that can be found in this habitat.
    let pokemon_species: [NamedAPIResource]
}

struct AwesomeNameResponse: Codable {
    /// The awesome name for this resource.
    let awesome_name: String
    /// The language that this name is in.
    let language: NamedAPIResource
}

struct PokemonShapeResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokemonShapeName
    /// The "scientific" name of this Pokémon shape listed in different languages.
    let awesome_names: [AwesomeNameResponse]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon species that have this shape.
    let pokemon_species: [NamedAPIResource]
}

struct GenusResponse: Codable {
    /// The genus of this Pokémon species listed in multiple languages.
    let genus: String
    /// The language this genus is in.
    let language: NamedAPIResource
}

struct PokemonSpeciesDexEntryResponse: Codable {
    /// The index number within the Pokédex.
    let entry_number: Int
    /// The Pokédex the referenced Pokémon species can be found in.
    let pokedex: NamedAPIResource
}

struct PalParkEncounterAreaResponse: Codable {
    /// The base score given to the player when this Pokémon is caught during a pal park run.
    let base_score: Int
    /// The base rate for encountering this Pokémon in this pal park area.
    let rate: Int
    /// The pal park area the referenced Pokémon can be encountered in.
    let area: NamedAPIResource
}

struct PokemonSpeciesVarietyResponse: Codable {
    /// Whether this variety is the default variety.
    let is_default: Bool
    /// The Pokémon variety.
    let pokemon: NamedAPIResource
}

struct PokemonSpeciesResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: PokemonSpeciesName
    /// The order in which species should be sorted.
    let order: Int
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless.
    let gender_rate: Int
    /// The base capture rate; up to 255. The higher the number, the easier the catch.
    let capture_rate: Int
    /// The happiness when caught by a normal Pokéball; up to 255. The higher the number, the happier the Pokémon.
    let base_happiness: Int
    /// Whether or not this is a baby Pokémon.
    let is_baby: Bool
    /// Whether or not this is a legendary Pokémon.
    let is_legendary: Bool
    /// Whether or not this is a mythical Pokémon.
    let is_mythical: Bool
    /// Initial hatch counter: one must walk 255 × (hatch_counter + 1) steps before this Pokémon's egg hatches; up to 20.
    let hatch_counter: Int
    /// Whether or not this Pokémon has visual gender differences.
    let has_gender_differences: Bool
    /// Whether or not this Pokémon has multiple forms and can switch between them.
    let forms_switchable: Bool
    /// The rate at which this Pokémon species gains levels.
    let growth_rate: NamedAPIResource
    /// A list of Pokédexes and the indexes reserved within them for this Pokémon species.
    let pokedex_numbers: [PokemonSpeciesDexEntryResponse]
    /// A list of egg groups this Pokémon species is a member of.
    let egg_groups: [NamedAPIResource]
    /// The color of this Pokémon for Pokédex search.
    let color: NamedAPIResource
    /// The shape of this Pokémon for Pokédex search.
    let shape: NamedAPIResource
    /// The Pokémon species that evolves into this Pokémon species.
    let evolves_from_species: NamedAPIResource?
    /// The evolution chain this Pokémon species is a member of.
    let evolution_chain: APIResource
    /// The habitat this Pokémon species can be encountered in.
    let habitat: NamedAPIResource?
    /// The generation this Pokémon species was introduced in.
    let generation: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of pal park areas where this Pokémon species can be encountered.
    let pal_park_encounters: [PalParkEncounterAreaResponse]
    /// The flavor text of this Pokémon species listed in different languages.
    let flavor_text_entries: [FlavorTextResponse]
    /// Descriptions of different forms Pokémon take on within the Pokémon species.
    let form_descriptions: [DescriptionResponse]
    /// The genus of this Pokémon species listed in multiple languages.
    let genera: [GenusResponse]
    /// A list of the Pokémon varieties in this Pokémon species.
    let varieties: [PokemonSpeciesVarietyResponse]
}

struct MoveStatAffectResponse: Codable {
    /// The maximum change.
    let change: Int
    /// The move causing the change.
    let move: NamedAPIResource
}

struct MoveStatAffectSetsResponse: Codable {
    /// A list of moves and how they change the referenced stat.
    let increase: [MoveStatAffectResponse]
    /// A list of moves and how they change the referenced stat.
    let decrease: [MoveStatAffectResponse]
}

struct NatureStatAffectSetsResponse: Codable {
    /// A list of natures and how they change the referenced stat.
    let increase: [NamedAPIResource]
    /// A list of natures and how they change the referenced stat.
    let decrease: [NamedAPIResource]
}

struct StatResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: StatName
    /// The internal id of an API resource within game data.
    let game_index: Int
    /// Whether this stat only exists within a battle.
    let is_battle_only: Bool
    /// A detail of moves which affect this stat positively or negatively.
    let affecting_moves: MoveStatAffectSetsResponse
    /// A detail of natures which affect this stat positively or negatively.
    let affecting_natures: NatureStatAffectSetsResponse
    /// A list of characteristics that are set on a Pokémon when its highest base stat is this stat.
    let characteristics: [APIResource]
    /// The class of damage this stat is directly related to.
    let move_damage_class: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

struct TypeRelationsResponse: Codable {
    /// A list of types this type has no effect on.
    let no_damage_to: [NamedAPIResource]
    /// A list of types this type has half damage to.
    let half_damage_to: [NamedAPIResource]
    /// A list of types this type has double damage to.
    let double_damage_to: [NamedAPIResource]
    /// A list of types that have no effect on this type.
    let no_damage_from: [NamedAPIResource]
    /// A list of types that have half damage from this type.
    let half_damage_from: [NamedAPIResource]
    /// A list of types that have double damage from this type.
    let double_damage_from: [NamedAPIResource]
}

struct TypeRelationsPastResponse: Codable {
    /// The generation relevant to this type damage relations.
    let generation: NamedAPIResource
    /// The damage relations the type had in previous generations.
    let damage_relations: TypeRelationsResponse
}

struct TypePokemonResponse: Codable {
    /// The order the Pokémon's types are listed in.
    let slot: Int
    /// The Pokémon that has the referenced type.
    let pokemon: NamedAPIResource
}

struct TypeResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: TypeName
    /// A detail of how effective this type is toward others and vice versa.
    let damage_relations: TypeRelationsResponse
    /// A list of details showing how effective this type was toward others and vice versa in previous generations.
    let past_damage_relations: [TypeRelationsPastResponse]
    /// A list of game indices relevant to this type by generation.
    let game_indices: [GenerationGameIndexResponse]
    /// The generation this type was introduced in.
    let generation: NamedAPIResource
    /// The class of damage inflicted by this type.
    let move_damage_class: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon that have this type.
    let pokemon: [TypePokemonResponse]
    /// A list of moves that have this type.
    let moves: [NamedAPIResource]
}
