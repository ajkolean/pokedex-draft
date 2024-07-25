import Foundation
import SwiftData

@Model
public class PokemonTypeDetailsEntity {
    @Attribute(.unique)
    public let name: String
    public let id: Int
    public let damageRelations: DamageRelations
    public let pokemon: [PokemonTypeSlot]

    public init(name: String, id: Int, damageRelations: DamageRelations, pokemon: [PokemonTypeSlot]) {
        self.name = name
        self.id = id
        self.damageRelations = damageRelations
        self.pokemon = pokemon
    }

    public var asModel: PokemonTypeDetails {
        .init(damageRelations: damageRelations, id: id, name: name, pokemon: pokemon)
    }

    public convenience init(_ response: PokemonTypeDetails) {
        self.init(name: response.name, id: response.id, damageRelations: response.damageRelations, pokemon: response.pokemon)
    }
}
