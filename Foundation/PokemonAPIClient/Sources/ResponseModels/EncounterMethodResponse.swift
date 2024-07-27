import Foundation

struct EncounterMethodResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: EncounterMethodName
    /// A good value for sorting.
    let order: Int
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}

struct EncounterConditionResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: EncounterConditionName
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
    /// A list of possible values for this encounter condition.
    let values: [NamedAPIResource]
}

struct EncounterConditionValueResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: EncounterConditionValueName
    /// The condition this encounter condition value pertains to.
    let condition: NamedAPIResource
    /// The name of this resource listed in different languages.
    let names: [NameResponse]
}
