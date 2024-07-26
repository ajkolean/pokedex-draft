import Foundation



struct ContestComboDetailResponse: Codable {
    /// A list of moves to use before this move.
    let use_before: [NamedAPIResource]?
    /// A list of moves to use after this move.
    let use_after: [NamedAPIResource]?
}

struct ContestComboSetsResponse: Codable {
    /// Normal contest combo details.
    let normal: ContestComboDetailResponse
    /// Super contest combo details.
    let `super`: ContestComboDetailResponse
}

struct MoveFlavorTextResponse: Codable {
    /// The localized flavor text for an API resource in a specific language.
    let flavor_text: String
    /// The language this name is in.
    let language: NamedAPIResource
    /// The version group that uses this flavor text.
    let version_group: NamedAPIResource
}

struct MoveMetaDataResponse: Codable {
    /// The status ailment this move inflicts on its target.
    let ailment: NamedAPIResource
    /// The category of move this move falls under, e.g. damage or ailment.
    let category: NamedAPIResource
    /// The minimum number of times this move hits. Null if it always only hits once.
    let min_hits: Int?
    /// The maximum number of times this move hits. Null if it always only hits once.
    let max_hits: Int?
    /// The minimum number of turns this move continues to take effect. Null if it always only lasts one turn.
    let min_turns: Int?
    /// The maximum number of turns this move continues to take effect. Null if it always only lasts one turn.
    let max_turns: Int?
    /// HP drain (if positive) or Recoil damage (if negative), in percent of damage done.
    let drain: Int
    /// The amount of hp gained by the attacking Pokémon, in percent of its maximum HP.
    let healing: Int
    /// Critical hit rate bonus.
    let crit_rate: Int
    /// The likelihood this attack will cause an ailment.
    let ailment_chance: Int
    /// The likelihood this attack will cause the target Pokémon to flinch.
    let flinch_chance: Int
    /// The likelihood this attack will cause a stat change in the target Pokémon.
    let stat_chance: Int
}

struct MoveStatChangeResponse: Codable {
    /// The amount of change.
    let change: Int
    /// The stat being affected.
    let stat: NamedAPIResource
}

struct PastMoveStatValuesResponse: Codable {
    /// The percent value of how likely this move is to be successful.
    let accuracy: Int?
    /// The percent value of how likely it is this move's effect will take effect.
    let effect_chance: Int?
    /// The base power of this move with a value of 0 if it does not have a base power.
    let power: Int?
    /// Power points. The number of times this move can be used.
    let pp: Int?
    /// The effect of this move listed in different languages.
    let effect_entries: [VerboseEffectResponse]
    /// The elemental type of this move.
    let type: NamedAPIResource
    /// The version group in which these move stat values were in effect.
    let version_group: NamedAPIResource
}

struct MoveResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The percent value of how likely this move is to be successful.
    let accuracy: Int?
    /// The percent value of how likely it is this move's effect will happen.
    let effect_chance: Int?
    /// Power points. The number of times this move can be used.
    let pp: Int
    /// A value between -8 and 8. Sets the order in which moves are executed during battle. See Bulbapedia for greater detail.
    let priority: Int
    /// The base power of this move with a value of 0 if it does not have a base power.
    let power: Int?
    /// A detail of normal and super contest combos that require this move.
    let contest_combos: ContestComboSetsResponse?
    /// The type of appeal this move gives a Pokémon when used in a contest.
    let contest_type: NamedAPIResource?
    /// The effect the move has when used in a contest.
    let contest_effect: APIResource?
    /// The type of damage the move inflicts on the target, e.g. physical.
    let damage_class: NamedAPIResource
    /// The effect of this move listed in different languages.
    let effect_entries: [VerboseEffectResponse]
    /// The list of previous effects this move has had across version groups of the games.
    let effect_changes: [AbilityEffectChangeResponse]
    /// The generation this move was introduced in.
    let generation: NamedAPIResource
    /// Metadata about this move.
    let meta: MoveMetaDataResponse?
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of move resource value changes across version groups of the game.
    let past_values: [PastMoveStatValuesResponse]
    /// A list of stats this move affects and how much it affects them.
    let stat_changes: [MoveStatChangeResponse]
    /// The effect the move has when used in a super contest.
    let super_contest_effect: APIResource?
    /// The type of target that will receive the effects of the attack.
    let target: NamedAPIResource
    /// The elemental type of this move.
    let type: NamedAPIResource
    /// List of Pokémon that can learn the move.
    let learned_by_pokemon: [NamedAPIResource]
    /// The flavor text of this move listed in different languages.
    let flavor_text_entries: [MoveFlavorTextResponse]
}

struct MoveAilmentResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// A list of moves that cause this ailment.
    let moves: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

struct MoveBattleStyleResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

struct MoveCategoryResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// A list of moves that fall into this category.
    let moves: [NamedAPIResource]
    /// The description of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
}

struct MoveDamageClassResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The description of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
    /// A list of moves that fall into this damage class.
    let moves: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

struct MoveLearnMethodResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The description of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of version groups where moves can be learned through this method.
    let version_groups: [NamedAPIResource]
}

struct MoveTargetResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The description of this resource listed in different languages.
    let descriptions: [DescriptionResponse]
    /// A list of moves that are directed at this target.
    let moves: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}
