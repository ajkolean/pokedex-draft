import Foundation

// MARK: - Main Structs
public struct PokemonTypeResponse: Codable {
    public let damageRelations: DamageRelationsResponse
    public let id: Int
    public let name: String
    public let pokemon: [PokemonSlotResponse]
    
    public enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case id
        case name
        case pokemon
    }
}

// MARK: - Damage Relations
public struct DamageRelationsResponse: Codable {
    public let doubleDamageFrom: [NamedAPIResource]
    public let doubleDamageTo: [NamedAPIResource]
    public let halfDamageFrom: [NamedAPIResource]
    public let halfDamageTo: [NamedAPIResource]
    public let noDamageFrom: [NamedAPIResource]
    public let noDamageTo: [NamedAPIResource]
    
    public enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}

// MARK: - Pokemon Slot
public struct PokemonSlotResponse: Codable {
    public let pokemon: NamedAPIResource
    public let slot: Int
}

extension PokemonTypeResponse {
    public var pokemonIdentifiers: [PokemonIdentifier] {
        pokemon.map { $0.pokemon }
            .map { pokemon in
                PokemonIdentifier(id: pokemon.url.extractID()!, name: pokemon.name, url: pokemon.url)
        }
    }
}
