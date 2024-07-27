import Foundation
import Models

extension Models.PokemonTypeDetails {
    init(_ response: TypeResponse) {
        self.init(
            damageRelations: .init(response.damage_relations),
            id: response.id,
            name: response.name.rawValue,
            pokemon: .init(response.pokemon)
        )
    }
}

extension Models.DamageRelations {
    init(_ response: TypeRelationsResponse) {
        self.init(
            doubleDamageFrom: .init(response.double_damage_from),
            doubleDamageTo: .init(response.double_damage_to),
            halfDamageFrom: .init(response.half_damage_from),
            halfDamageTo: .init(response.half_damage_to),
            noDamageFrom: .init(response.no_damage_from),
            noDamageTo: .init(response.no_damage_to)
        )
    }
}

extension Models.PokemonTypeSlot {
    init(_ response: TypePokemonResponse) {
        self.init(pokemon: PokemonIdentifier(response.pokemon), slot: response.slot)
    }
}

extension [Models.PokemonTypeSlot] {
    init(_ resources: [TypePokemonResponse]) {
        self = resources.map { PokemonTypeSlot($0) }
    }
}

// Legacy
extension TypeIdentifier {
    init(_ response: NamedAPIResource) {
        self.init(name: response.name, url: response.url)
    }
}

extension [TypeIdentifier] {
    init(_ resources: [NamedAPIResource]) {
        self = resources.map { TypeIdentifier($0) }
    }
}

extension PokemonIdentifier {
    init(_ response: NamedAPIResource) {
        self.init(id: response.url.extractID(), name: response.name, url: response.url)
    }
}

extension [PokemonIdentifier] {
    init(_ resources: [NamedAPIResource]) {
        self = resources.map { PokemonIdentifier($0) }
    }
}
