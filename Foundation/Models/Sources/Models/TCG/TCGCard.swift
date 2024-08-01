import Foundation

extension TCG {
    public struct CardList: Hashable, Codable, Sendable {
        public var cards: [Card]
        public let page: Int
        public let pageSize: Int
        public let count: Int
        public let totalCount: Int

        private enum CodingKeys: String, CodingKey {
            case cards = "data"
            case page
            case pageSize
            case count
            case totalCount
        }
    }

    public struct Card: Hashable, Codable, Identifiable, Sendable {
 
        public var cardName: CardName { .init(rawValue: name) }

        public var cardID: CardID { .init(rawValue: id) }

        public struct AncientTrait: Codable, Hashable, Sendable {
            public let name: String
            public let text: String
        }

        public struct Ability: Codable, Hashable, Sendable {
            public let name: String
            public let text: String
            public let type: String
        }

        public struct Attack: Codable, Hashable, Sendable {
            public let cost: [TCG.CardType]?
            public let name: String
            public let text: String
            public let damage: String
            public let convertedEnergyCost: Int
        }

        public struct Image: Codable, Hashable, Sendable {
            public let small: URL
            public let large: URL
        }

        public struct Weakness: Codable, Hashable, Sendable {
            public let type: TCG.CardType
            public let value: String
        }

        public struct Resistance: Codable, Hashable, Sendable {
            public let type: TCG.CardType
            public let value: String
        }

        public var id: String
        public var name: String

        public let supertype: TCG.SuperType?
        public let subtypes: [TCG.Subtype]?
        public let level: String?
        public let hp: String?
        public let types: [TCG.CardType]?
        public let evolvesFrom: String?
        public let evolvesTo: [TCG.CardName]?
        public let rules: [String]?
        public let ancientTrait: AncientTrait?
        public let abilities: [Ability]?
        public let attacks: [Attack]?
        public let weaknesses: [Weakness]?
        public let resistances: [Resistance]?
        public let retreatCost: [TCG.CardType]?
        public let convertedRetreatCost: Int?
        public let set: TCG.Set
        public let number: String?
        public let artist: String?
        public let rarity: TCG.Rarity?
        public let flavorText: String?
        public let nationalPokedexNumbers: [Int]?
        public let regulationMark: String?
        public let images: Image
        public let tcgplayer: TCG.Player?
        public let cardmarket: TCG.CardMarket?

        public init(
            id: String,
            name: String,
            supertype: TCG.SuperType?,
            subtypes: [TCG.Subtype]?,
            level: String?,
            hp: String?,
            types: [TCG.CardType]?,
            evolvesFrom: String?,
            evolvesTo: [TCG.CardName]?,
            rules: [String]?,
            ancientTrait: AncientTrait?,
            abilities: [Ability]?,
            attacks: [Attack]?,
            weaknesses: [Weakness]?,
            resistances: [Resistance]?,
            retreatCost: [TCG.CardType]?,
            convertedRetreatCost: Int?,
            set: TCG.Set,
            number: String?,
            artist: String?,
            rarity: TCG.Rarity?,
            flavorText: String?,
            nationalPokedexNumbers: [Int]?,
            regulationMark: String?,
            images: Image,
            tcgplayer: TCG.Player?,
            cardmarket: TCG.CardMarket?
        ) {
            self.id = id
            self.name = name
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
}

extension TCG {
    public struct CardName: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    
    // MARK: - PokemonID
    
    public struct CardID: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
}
