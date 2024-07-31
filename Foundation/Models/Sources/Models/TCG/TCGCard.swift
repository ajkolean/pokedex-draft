import Foundation


extension TCG {
    public struct Card: Hashable, Codable, Identifiable, Sendable  {
        public typealias Name = Identifier<String>
        public typealias ID = Identifier<Int>
        
        public struct AncientTrait: Codable, Hashable, Sendable {
            public let name: String
            public let text: String
        }
        
        public struct Ability: Codable, Hashable, Sendable  {
            public let name: String
            public let text: String
            public let type: String
        }
        
        public struct Attack: Codable, Hashable, Sendable  {
            public let cost: [TCG.CardType]
            public let name: String
            public let text: String
            public let damage: String
            public let convertedEnergyCost: Int
        }
        
        public struct Image: Codable, Hashable, Sendable  {
            public let small: URL
            public let large: URL
        }
        
        public struct Weakness: Codable, Hashable, Sendable  {
            public let type: TCG.CardType
            public let value: String
        }
        
        public struct Resistance: Codable, Hashable, Sendable  {
            public let type: TCG.CardType
            public let value: String
        }
        
        public let id: ID
        public let name: Name
        public let supertype: TCG.SuperType
        public let subtypes: [TCG.Subtype]
        public let level: String
        public let hp: String
        public let types: [TCG.CardType]
        public let evolvesFrom: Pokemon.Name
        public let evolvesTo: [Pokemon.Name]
        public let rules: [String]
        public let ancientTrait: AncientTrait
        public let abilities: [Ability]
        public let attacks: [Attack]
        public let weaknesses: [Weakness]
        public let resistances: [Resistance]
        public let retreatCost: [TCG.CardType]
        public let convertedRetreatCost: Int
        public let set: TCG.Set
        public let number: String
        public let artist: String
        public let rarity: TCG.Rarity
        public let flavorText: String
        public let nationalPokedexNumbers: [Int]
        public let regulationMark: String
        public let images: Image
        public let tcgplayer: TCG.Player
        public let cardmarket: TCG.CardMarket
    }
    
    
}
