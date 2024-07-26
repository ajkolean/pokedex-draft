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
    
    public init(doubleDamageFrom: [TypeIdentifier], doubleDamageTo: [TypeIdentifier], halfDamageFrom: [TypeIdentifier], halfDamageTo: [TypeIdentifier], noDamageFrom: [TypeIdentifier], noDamageTo: [TypeIdentifier]) {
        self.doubleDamageFrom = doubleDamageFrom
        self.doubleDamageTo = doubleDamageTo
        self.halfDamageFrom = halfDamageFrom
        self.halfDamageTo = halfDamageTo
        self.noDamageFrom = noDamageFrom
        self.noDamageTo = noDamageTo
    }
}

// MARK: - Pokemon Slot

public struct PokemonTypeSlot: Hashable, Codable, Sendable {
    public let pokemon: PokemonIdentifier
    public let slot: Int
    
    public init(pokemon: PokemonIdentifier, slot: Int) {
        self.pokemon = pokemon
        self.slot = slot
    }
}
