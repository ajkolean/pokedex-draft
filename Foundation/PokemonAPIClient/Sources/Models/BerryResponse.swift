import Foundation

// Model for the BerryFlavorMap response
struct BerryFlavorMapResponse: Codable {
    /// How powerful the referenced flavor is for this berry.
    let potency: Int
    /// The referenced berry flavor.
    let flavor: NamedAPIResource
}

// Model for the Berry response
struct BerryResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: BerryName
    /// Time it takes the tree to grow one stage, in hours. Berry trees go through four of these growth stages before they can be
    /// picked.
    let growth_time: Int
    /// The maximum number of these berries that can grow on one tree in Generation IV.
    let max_harvest: Int
    /// The power of the move "Natural Gift" when used with this Berry.
    let natural_gift_power: Int
    /// The size of this Berry, in millimeters.
    let size: Int
    /// The smoothness of this Berry, used in making Pokéblocks or Poffins.
    let smoothness: Int
    /// The speed at which this Berry dries out the soil as it grows. A higher rate means the soil dries more quickly.
    let soil_dryness: Int
    /// The firmness of this berry, used in making Pokéblocks or Poffins.
    let firmness: NamedAPIResource
    /// A list of references to each flavor a berry can have and the potency of each of those flavors in regard to this berry.
    let flavors: [BerryFlavorMapResponse]
    /// Berries are actually items. This is a reference to the item-specific data for this berry.
    let item: NamedAPIResource
    /// The type inherited by "Natural Gift" when used with this Berry.
    let natural_gift_type: NamedAPIResource
}

// Model for the BerryFirmness response
struct BerryFirmnessResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: BerryFirmnessName
    /// A list of the berries with this firmness.
    let berries: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

// Model for the FlavorBerryMap response
struct FlavorBerryMapResponse: Codable {
    /// How powerful the referenced flavor is for this berry.
    let potency: Int
    /// The berry with the referenced flavor.
    let berry: NamedAPIResource
}

// Model for the BerryFlavor response
struct BerryFlavorResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: BerryFlavorName
    /// A list of the berries with this flavor.
    let berries: [FlavorBerryMapResponse]
    /// The contest type that correlates with this berry flavor.
    let contest_type: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}
