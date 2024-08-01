import Models
import SwiftData
import Foundation

public struct TCGCardEntityDetail: Codable, Hashable, Sendable  {
    public var types: [TCG.CardType]?
    public var subtypes: [TCG.Subtype]?
    public var evolvesTo: [TCG.CardName]?
    public var nationalPokedexNumbers: [Int]?
    public var retreatCost: [TCG.CardType]?
    public var rules: [String]?
}

@Model
public final class TCGCardEntity {
    @Attribute(.unique)
    public var id: String
    public var name: String
    public var entitySetID: String
    public var cardData: Data
//    public var cardModel: TCG.Card
//    public var supertype: TCG.SuperType?
//    public var level: String?
//    public var hp: String?
//    public var evolvesFrom: String?
//    public var ancientTrait: TCG.Card.AncientTrait?
//    public var abilities: [TCG.Card.Ability]?
//    public var attacks: [TCG.Card.Attack]?
//    public var weaknesses: [TCG.Card.Weakness]?
//    public var resistances: [TCG.Card.Resistance]?
//    public var convertedRetreatCost: Int?
//    public var set: TCG.Set
//    public var number: String?
//    public var artist: String?
//    public var rarity: TCG.Rarity?
//    public var flavorText: String?
//    public var regulationMark: String?
//    public var images: TCG.Card.Image
//    public var tcgplayer: TCG.Player?
//    public var cardmarket: TCG.CardMarket?
//    public var details: TCGCardEntityDetail?
//
//    public init(id: String, name: String, setName: String, supertype: TCG.SuperType? = nil, level: String? = nil, hp: String? = nil, evolvesFrom: String? = nil, rules: [String]? = nil, ancientTrait: TCG.Card.AncientTrait? = nil, abilities: [TCG.Card.Ability]? = nil, attacks: [TCG.Card.Attack]? = nil, weaknesses: [TCG.Card.Weakness]? = nil, resistances: [TCG.Card.Resistance]? = nil, convertedRetreatCost: Int? = nil, set: TCG.Set, number: String? = nil, artist: String? = nil, rarity: TCG.Rarity? = nil, flavorText: String? = nil, regulationMark: String? = nil, images: TCG.Card.Image, tcgplayer: TCG.Player? = nil, cardmarket: TCG.CardMarket? = nil, details: TCGCardEntityDetail? = nil) {
//        self.id = id
//        self.name = name
//        self.setName = setName
//        self.supertype = supertype
//        self.level = level
//        self.hp = hp
//        self.evolvesFrom = evolvesFrom
//        self.ancientTrait = ancientTrait
//        self.abilities = abilities
//        self.attacks = attacks
//        self.weaknesses = weaknesses
//        self.resistances = resistances
//        self.convertedRetreatCost = convertedRetreatCost
//        self.set = set
//        self.number = number
//        self.artist = artist
//        self.rarity = rarity
//        self.flavorText = flavorText
//        self.regulationMark = regulationMark
//        self.images = images
//        self.tcgplayer = tcgplayer
//        self.cardmarket = cardmarket
//        self.details = details
//    }
    
    public init(id: String, name: String, entitySetID: String, cardData: Data) {
        self.id = id
        self.name = name
        self.entitySetID = entitySetID
        self.cardData = cardData
    }
}

extension TCGCardEntity {
    convenience init(_ model: TCG.Card) {


        self.init(
            id: model.id,
            name: model.name,
            entitySetID: model.set.id,
            cardData: try! JSONEncoder().encode(model)
//            supertype: model.supertype,
//            level: model.level,
//            hp: model.hp,
//            evolvesFrom: model.evolvesFrom,
//            rules: model.rules,
//            ancientTrait: model.ancientTrait,
//            abilities: model.abilities,
//            attacks: model.attacks,
//            weaknesses: model.weaknesses,
//            resistances: model.resistances,
//            convertedRetreatCost: model.convertedRetreatCost,
//            set: model.set,
//            number: model.number,
//            artist: model.artist,
//            rarity: model.rarity,
//            flavorText: model.flavorText,
//            regulationMark: model.regulationMark,
//            images: model.images,
//            tcgplayer: model.tcgplayer,
//            cardmarket: model.cardmarket,
//            details: details
        )
    }
}
//
//extension TCG.Card {
//    init(_ entity: TCGCardEntity) {
//        self.init(
//            id: entity.id,
//            name: entity.name,
//            supertype: entity.supertype,
//            subtypes: entity.details?.subtypes,
//            level: entity.level,
//            hp: entity.hp,
//            types: entity.details?.types,
//            evolvesFrom: entity.evolvesFrom,
//            evolvesTo: entity.details?.evolvesTo,
//            rules: entity.details?.rules,
//            ancientTrait: entity.ancientTrait,
//            abilities: entity.abilities,
//            attacks: entity.attacks,
//            weaknesses: entity.weaknesses,
//            resistances: entity.resistances,
//            retreatCost: entity.details?.retreatCost,
//            convertedRetreatCost: entity.convertedRetreatCost,
//            set: entity.set,
//            number: entity.number,
//            artist: entity.artist,
//            rarity: entity.rarity,
//            flavorText: entity.flavorText,
//            nationalPokedexNumbers: entity.details?.nationalPokedexNumbers,
//            regulationMark: entity.regulationMark,
//            images: entity.images,
//            tcgplayer: entity.tcgplayer,
//            cardmarket: entity.cardmarket
//        )
//    }
//}
