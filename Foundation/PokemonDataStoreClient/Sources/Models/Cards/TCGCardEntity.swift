import Models
import SwiftData

@Model
public final class TCGCardEntity {
    @Attribute(.unique)
    public let _id: String
    public let _name: String
    public let supertype: TCG.SuperType?
    public let subtypes: [TCG.Subtype]?
    public let level: String?
    public let hp: String?
    public let types: [TCG.CardType]?
    public let evolvesFrom: String?
    public let evolvesTo: [String]?
    public let rules: [String]?
    public let ancientTrait: TCG.Card.AncientTrait?
    public let abilities: [TCG.Card.Ability]?
    public let attacks: [TCG.Card.Attack]?
    public let weaknesses: [TCG.Card.Weakness]?
    public let resistances: [TCG.Card.Resistance]?
    public let retreatCost: [TCG.CardType]?
    public let convertedRetreatCost: Int?
    public let set: TCG.Set
    public let number: String?
    public let artist: String?
    public let rarity: TCG.Rarity?
    public let flavorText: String?
    public let nationalPokedexNumbers: [Int]?
    public let regulationMark: String?
    public let images: TCG.Card.Image
    public let tcgplayer: TCG.Player?
    public let cardmarket: TCG.CardMarket?
    
    public init(id: String, name: String, supertype: TCG.SuperType?, subtypes: [TCG.Subtype]?, level: String?, hp: String?, types: [TCG.CardType]?, evolvesFrom: String?, evolvesTo: [String]?, rules: [String]?, ancientTrait: TCG.Card.AncientTrait?, abilities: [TCG.Card.Ability]?, attacks: [TCG.Card.Attack]?, weaknesses: [TCG.Card.Weakness]?, resistances: [TCG.Card.Resistance]?, retreatCost: [TCG.CardType]?, convertedRetreatCost: Int?, set: TCG.Set, number: String?, artist: String?, rarity: TCG.Rarity?, flavorText: String?, nationalPokedexNumbers: [Int]?, regulationMark: String?, images: TCG.Card.Image, tcgplayer: TCG.Player?, cardmarket: TCG.CardMarket?) {
        self._id = id
        self._name = name
        self.supertype = supertype
        self.subtypes = subtypes
        self.level = level
        self.hp = hp
        self.types = types
        self.evolvesFrom = evolvesFrom
        self.evolvesTo = evolvesTo
        self.rules = rules
        self.ancientTrait = ancientTrait
        self.abilities = abilities
        self.attacks = attacks
        self.weaknesses = weaknesses
        self.resistances = resistances
        self.retreatCost = retreatCost
        self.convertedRetreatCost = convertedRetreatCost
        self.set = set
        self.number = number
        self.artist = artist
        self.rarity = rarity
        self.flavorText = flavorText
        self.nationalPokedexNumbers = nationalPokedexNumbers
        self.regulationMark = regulationMark
        self.images = images
        self.tcgplayer = tcgplayer
        self.cardmarket = cardmarket
    }
}


extension TCGCardEntity {
    convenience init(_ model: TCG.Card) {
        self.init(
            id: model.id.rawValue,
            name: model.name.rawValue,
            supertype: model.supertype,
            subtypes: model.subtypes,
            level: model.level,
            hp: model.hp,
            types: model.types,
            evolvesFrom: model.evolvesFrom,
            evolvesTo: model.evolvesTo,
            rules: model.rules,
            ancientTrait: model.ancientTrait,
            abilities: model.abilities,
            attacks: model.attacks,
            weaknesses: model.weaknesses,
            resistances: model.resistances,
            retreatCost: model.retreatCost,
            convertedRetreatCost: model.convertedRetreatCost,
            set: model.set,
            number: model.number,
            artist: model.artist,
            rarity: model.rarity,
            flavorText: model.flavorText,
            nationalPokedexNumbers: model.nationalPokedexNumbers,
            regulationMark: model.regulationMark,
            images: model.images,
            tcgplayer: model.tcgplayer,
            cardmarket: model.cardmarket
        )
    }
}

extension TCG.Card {
    init(_ entity: TCGCardEntity) {
        self.init(
            id: TCG.Card.Name(rawValue: entity._id),
            name: TCG.Card.Name(rawValue: entity._name),
            supertype: entity.supertype,
            subtypes: entity.subtypes,
            level: entity.level,
            hp: entity.hp,
            types: entity.types,
            evolvesFrom:  entity.evolvesFrom,
            evolvesTo: entity.evolvesTo,
            rules: entity.rules,
            ancientTrait: entity.ancientTrait,
            abilities: entity.abilities,
            attacks: entity.attacks,
            weaknesses: entity.weaknesses,
            resistances: entity.resistances,
            retreatCost: entity.retreatCost,
            convertedRetreatCost: entity.convertedRetreatCost,
            set: entity.set,
            number: entity.number,
            artist: entity.artist,
            rarity: entity.rarity,
            flavorText: entity.flavorText,
            nationalPokedexNumbers: entity.nationalPokedexNumbers,
            regulationMark: entity.regulationMark,
            images: entity.images,
            tcgplayer: entity.tcgplayer,
            cardmarket: entity.cardmarket
        )
    }
}
