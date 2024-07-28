import Apollo
import Foundation
import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct PokemonType: Hashable, Codable, Identifiable, Sendable {
    public let _id: Int
    public let type: PokemonTypeEnum
    public let attackDamageRelations: [DamageRelation]
    public let defenseDamageRelations: [DamageRelation]
    public let pokemonByTypeSlot: [PokemonByTypeSlot]

    // MARK: - PokemonID

    public struct ID: Codable, IdentifierProtocol, ExpressibleByIntegerLiteral {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    public var id: ID {
        get { .init(rawValue: _id) }
    }

    public struct DamageRelation: Hashable, Codable, Sendable {
        public let damageFactor: Int
        public let targetType: PokemonTypeEnum
    }

    public var doubleDamageTo: [PokemonTypeEnum] {
        attackDamageRelations.filter { $0.damageFactor == 200 }.map(\.targetType)
    }

    public var halfDamageTo: [PokemonTypeEnum] {
        attackDamageRelations.filter { $0.damageFactor == 50 }.map(\.targetType)
    }

    public var noDamageTo: [PokemonTypeEnum] {
        attackDamageRelations.filter { $0.damageFactor == 0 }.map(\.targetType)
    }

    public var doubleDamageFrom: [PokemonTypeEnum] {
        defenseDamageRelations.filter { $0.damageFactor == 200 }.map(\.targetType)
    }

    public var halfDamageFrom: [PokemonTypeEnum] {
        defenseDamageRelations.filter { $0.damageFactor == 50 }.map(\.targetType)
    }

    public var noDamageFrom: [PokemonTypeEnum] {
        defenseDamageRelations.filter { $0.damageFactor == 0 }.map(\.targetType)
    }
}

@MemberwiseInit(.public)
public struct PokemonByTypeSlot: Hashable, Codable, Sendable {
    public let slot: Int
    public let pokemonID: Int
    public let pokemon: Pokemon
}

extension PokemonType {
    init(_ apiModel: GraphClient.TypeFragment) {
        let id = apiModel.id
        let type = PokemonTypeEnum(rawValue: apiModel.name) ?? .unknown
        let attackDamageRelations = apiModel.attackDamageRelations.map {
            DamageRelation(
                damageFactor: $0.damageFactor,
                targetType: PokemonTypeEnum(rawValue: $0.targetType?.name ?? "") ?? .unknown
            )
        }
        let defenseDamageRelations = apiModel.defenseDamageRelation.map {
            DamageRelation(
                damageFactor: $0.damageFactor,
                targetType: PokemonTypeEnum(rawValue: $0.targetType?.name ?? "") ?? .unknown
            )
        }
        let pokemonByTypeSlot = apiModel.pokemonByTypeSlot.compactMap { data -> PokemonByTypeSlot? in
            guard let fragment = data.pokemon?.fragments.pokemonFragment else { return nil }
            return PokemonByTypeSlot(slot: data.typeSlot, pokemonID: data.pokemonID ?? 0, pokemon: Pokemon(fragment))
        }

        self.init(
            _id: id,
            type: type,
            attackDamageRelations: attackDamageRelations,
            defenseDamageRelations: defenseDamageRelations,
            pokemonByTypeSlot: pokemonByTypeSlot
        )
    }
}
