import Foundation

struct EvolutionDetailResponse: Codable {
    /// The item required to cause evolution this into Pokémon species.
    let item: NamedAPIResource?
    /// The type of event that triggers evolution into this Pokémon species.
    let trigger: NamedAPIResource
    /// The id of the gender the evolving Pokémon species must be in order to evolve into this Pokémon species.
    let gender: Int?
    /// The item the evolving Pokémon species must be holding during the evolution trigger event to evolve into this Pokémon species.
    let held_item: NamedAPIResource?
    /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species.
    let known_move: NamedAPIResource?
    /// The evolving Pokémon species must know a move with this type during the evolution trigger event in order to evolve into this Pokémon species.
    let known_move_type: NamedAPIResource?
    /// The location the evolution must be triggered at.
    let location: NamedAPIResource?
    /// The minimum required level of the evolving Pokémon species to evolve into this Pokémon species.
    let min_level: Int?
    /// The minimum required level of happiness the evolving Pokémon species to evolve into this Pokémon species.
    let min_happiness: Int?
    /// The minimum required level of beauty the evolving Pokémon species to evolve into this Pokémon species.
    let min_beauty: Int?
    /// The minimum required level of affection the evolving Pokémon species to evolve into this Pokémon species.
    let min_affection: Int?
    /// Whether or not it must be raining in the overworld to cause evolution this Pokémon species.
    let needs_overworld_rain: Bool
    /// The Pokémon species that must be in the player's party in order for the evolving Pokémon species to evolve into this Pokémon species.
    let party_species: NamedAPIResource?
    /// The player must have a Pokémon of this type in their party during the evolution trigger event in order for the evolving Pokémon species to evolve into this Pokémon species.
    let party_type: NamedAPIResource?
    /// The required relation between the Pokémon's Attack and Defense stats. 1 means Attack > Defense. 0 means Attack = Defense. -1 means Attack < Defense.
    let relative_physical_stats: Int?
    /// The required time of day. Day or night.
    let time_of_day: String
    /// Pokémon species for which this one must be traded.
    let trade_species: NamedAPIResource?
    /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up.
    let turn_upside_down: Bool
}

struct ChainLinkResponse: Codable {
    /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.
    let is_baby: Bool
    /// The Pokémon species at this point in the evolution chain.
    let species: NamedAPIResource
    /// All details regarding the specific details of the referenced Pokémon species evolution.
    let evolution_details: [EvolutionDetailResponse]?
    /// A list of chain objects.
    let evolves_to: [ChainLinkResponse]
}

struct EvolutionChainResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon.
    let baby_trigger_item: NamedAPIResource?
    /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.
    let chain: ChainLinkResponse
}

struct EvolutionTriggerResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: EvolutionTriggerName
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of Pokémon species that result from this evolution trigger.
    let pokemon_species: [NamedAPIResource]
}
