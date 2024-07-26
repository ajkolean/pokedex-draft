import Foundation

struct ContestNameResponse: Codable {
    /// The name for this contest.
    let name: String
    /// The color associated with this contest's name.
    let color: String
    /// The language that this name is in.
    let language: NamedAPIResource
}

struct ContestTypeResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The name for this resource.
    let name: String
    /// The berry flavor that correlates with this contest type.
    let berry_flavor: NamedAPIResource
    /// The name of this contest type listed in different languages.
    let names: [ContestNameResponse]
}

struct ContestEffectResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The base number of hearts the user of this move gets.
    let appeal: Int
    /// The base number of hearts the user's opponent loses.
    let jam: Int
    /// The result of this contest effect listed in different languages.
    let effect_entries: [EffectResponse]
    /// The flavor text of this contest effect listed in different languages.
    let flavor_text_entries: [FlavorTextResponse]
}

struct SuperContestEffectResponse: Codable {
    /// The identifier for this resource.
    let id: Int
    /// The level of appeal this super contest effect has.
    let appeal: Int
    /// The flavor text of this super contest effect listed in different languages.
    let flavor_text_entries: [FlavorTextResponse]
    /// A list of moves that have the effect when used in super contests.
    let moves: [NamedAPIResource]
}
