//import Foundation
//
//public struct NamedListResponse: Decodable {
//    public let count: Int
//    public let next: String?
//    public let previous: String?
//    public let results: [NamedAPIResource]
//}
//
//
//public struct PokemonTypeResponse: Codable {
//    public let damageRelations: DamageRelationsResponse
//    public let id: Int
//    public let name: String
//    public let pokemon: [PokemonSlotResponse]
//    
//    public enum CodingKeys: String, CodingKey {
//        case damageRelations = "damage_relations"
//        case id
//        case name
//        case pokemon
//    }
//}
//
//// MARK: - Damage Relations
//
//public struct DamageRelationsResponse: Codable {
//    public let doubleDamageFrom: [NamedAPIResource]
//    public let doubleDamageTo: [NamedAPIResource]
//    public let halfDamageFrom: [NamedAPIResource]
//    public let halfDamageTo: [NamedAPIResource]
//    public let noDamageFrom: [NamedAPIResource]
//    public let noDamageTo: [NamedAPIResource]
//    
//    public enum CodingKeys: String, CodingKey {
//        case doubleDamageFrom = "double_damage_from"
//        case doubleDamageTo = "double_damage_to"
//        case halfDamageFrom = "half_damage_from"
//        case halfDamageTo = "half_damage_to"
//        case noDamageFrom = "no_damage_from"
//        case noDamageTo = "no_damage_to"
//    }
//}
//
//public struct PokedexNumberResponse: Codable, Hashable, Sendable {
//    public let entryNumber: Int
//    public let pokedex: NamedAPIResource
//    
//    public init(entryNumber: Int, pokedex: NamedAPIResource) {
//        self.entryNumber = entryNumber
//        self.pokedex = pokedex
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case entryNumber = "entry_number"
//        case pokedex
//    }
//}
//
//// MARK: - Pokemon Slot
//
//public struct PokemonSlotResponse: Codable {
//    public let pokemon: NamedAPIResource
//    public let slot: Int
//}
//
//
