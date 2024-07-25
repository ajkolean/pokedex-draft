import Foundation

public struct PokemonTypeDetails: Identifiable, Codable, Hashable {
    public let damageRelations: DamageRelations
    public let id: Int
    public let name: String
    public let pokemon: [PokemonTypeSlot]

    public init(damageRelations: DamageRelations, id: Int, name: String, pokemon: [PokemonTypeSlot]) {
        self.damageRelations = damageRelations
        self.id = id
        self.name = name
        self.pokemon = pokemon
    }
}

// MARK: - Damage Relations

public struct DamageRelations: Hashable, Codable {
    public let doubleDamageFrom: [TypeIdentifier]
    public let doubleDamageTo: [TypeIdentifier]
    public let halfDamageFrom: [TypeIdentifier]
    public let halfDamageTo: [TypeIdentifier]
    public let noDamageFrom: [TypeIdentifier]
    public let noDamageTo: [TypeIdentifier]
}

// MARK: - Pokemon Slot

public struct PokemonTypeSlot: Hashable, Codable, Sendable {
    public let pokemon: PokemonIdentifier
    public let slot: Int
}

extension PokemonTypeDetails {
    public init(_ response: PokemonTypeResponse) {
        self.init(
            damageRelations: .init(response.damageRelations),
            id: response.id,
            name: response.name,
            pokemon: .init(response.pokemon)
        )
    }
}

extension DamageRelations {
    public init(_ response: DamageRelationsResponse) {
        self.init(
            doubleDamageFrom: .init(response.doubleDamageFrom),
            doubleDamageTo: .init(response.doubleDamageTo),
            halfDamageFrom: .init(response.halfDamageFrom),
            halfDamageTo: .init(response.halfDamageTo),
            noDamageFrom: .init(response.noDamageFrom),
            noDamageTo: .init(response.noDamageTo)
        )
    }
}

extension PokemonTypeSlot {
    public init(_ response: PokemonSlotResponse) {
        self.init(pokemon: .init(response.pokemon), slot: response.slot)
    }
}

extension [PokemonTypeSlot] {
    public init(_ resources: [PokemonSlotResponse]) {
        self = resources.map { PokemonTypeSlot($0) }
    }
}
