import Foundation

struct ItemSpritesResponse: Codable {
    /// The default depiction of this item.
    let `default`: String
}

struct ItemHolderPokemonVersionDetailResponse: Codable {
    /// How often this Pokémon holds this item in this version.
    let rarity: Int
    /// The version that this item is held in by the Pokémon.
    let version: NamedAPIResource
}

struct ItemHolderPokemonResponse: Codable {
    /// The Pokémon that holds this item.
    let pokemon: NamedAPIResource
    /// The details for the version that this item is held in by the Pokémon.
    let version_details: [ItemHolderPokemonVersionDetailResponse]
}

struct ItemResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: ItemName
    /// The price of this item in stores.
    let cost: Int
    /// The power of the move Fling when used with this item.
    let fling_power: Int?
    /// The effect of the move Fling when used with this item.
    let fling_effect: NamedAPIResource?
    /// A list of attributes this item has.
    let attributes: [NamedAPIResource]
    /// The category of items this item falls into.
    let category: NamedAPIResource
    /// The effect of this ability listed in different languages.
    let effect_entries: [VerboseEffectResponse]
    /// The flavor text of this ability listed in different languages.
    let flavor_text_entries: [VersionGroupFlavorTextResponse]
    /// A list of game indices relevant to this item by generation.
    let game_indices: [GenerationGameIndexResponse]
    /// The name of this item listed in different languages.
    let names: [NameResponse]
    /// A set of sprites used to depict this item in the game.
    let sprites: ItemSpritesResponse
    /// A list of Pokémon that might be found in the wild holding this item.
    let held_by_pokemon: [ItemHolderPokemonResponse]
    /// An evolution chain this item requires to produce a baby during mating.
    let baby_trigger_for: APIResource?
}

struct ItemAttributeResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: ItemAttributeName
    /// A list of items that have this attribute.
    let items: [NamedAPIResource]
    /// The name of this item attribute listed in different languages.
    let names: [NameResponse]
    /// The description of this item attribute listed in different languages.
    let descriptions: [DescriptionResponse]
}

struct ItemCategoryResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: ItemCategoryName
    /// A list of items that are a part of this category.
    let items: [NamedAPIResource]
    /// The name of this item category listed in different languages.
    let names: [NameResponse]
    /// The pocket items in this category would be put in.
    let pocket: NamedAPIResource
}

struct ItemFlingEffectResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: ItemFlingEffectName
    /// The result of this fling effect listed in different languages.
    let effect_entries: [EffectResponse]
    /// A list of items that have this fling effect.
    let items: [NamedAPIResource]
}

struct ItemPocketResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: ItemPocketName
    /// A list of item categories that are relevant to this item pocket.
    let categories: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}
