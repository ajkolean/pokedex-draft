import PokemonGraphClientInterface
import SwiftData

@Model
public final class PokemonTypeEntity {
    public let id: PokemonType.ID
    @Attribute(.unique)
    public let type: PokemonTypeEnum
    public let attackDamageRelations: [PokemonType.DamageRelation]
    public let defenseDamageRelations: [PokemonType.DamageRelation]
    public let pokemonByTypeSlot: [PokemonByTypeSlot]
    
    public init(id: PokemonType.ID, type: PokemonTypeEnum, attackDamageRelations: [PokemonType.DamageRelation], defenseDamageRelations: [PokemonType.DamageRelation], pokemonByTypeSlot: [PokemonByTypeSlot], _$backingData: any BackingData<PokemonTypeEntity> = PokemonTypeEntity.createBackingData()) {
        self.id = id
        self.type = type
        self.attackDamageRelations = attackDamageRelations
        self.defenseDamageRelations = defenseDamageRelations
        self.pokemonByTypeSlot = pokemonByTypeSlot
        self._$backingData = _$backingData
    }
}

extension PokemonTypeEntity {
    convenience init(_ model: PokemonType) {
        self.init(id: model.id, type: model.type, attackDamageRelations: model.attackDamageRelations, defenseDamageRelations: model.defenseDamageRelations, pokemonByTypeSlot: model.pokemonByTypeSlot)
    }
}

extension PokemonType {
    init(_ model: PokemonTypeEntity) {
        self.init(id: model.id, type: model.type, attackDamageRelations: model.attackDamageRelations, defenseDamageRelations: model.defenseDamageRelations, pokemonByTypeSlot: model.pokemonByTypeSlot)
    }
}
