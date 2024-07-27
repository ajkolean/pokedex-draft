import Foundation
import MemberwiseInit

// Domain model for Item
@MemberwiseInit(.public)
public struct Item: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemName
    public let cost: Int
    public let flingPower: Int?
    public let flingEffect: String?
    public let attributes: [String]
    public let category: String
    public let effectEntries: [VerboseEffect]
    public let flavorTextEntries: [FlavorText]
    public let gameIndices: [GenerationGameIndex]
    public let names: [Name]
    public let sprites: Sprites
    public let heldByPokemon: [HeldPokemon]
    public let babyTriggerFor: URL?
    
    @MemberwiseInit(.public)
    public struct VerboseEffect: Codable, Hashable {
        public let effect: String
        public let shortEffect: String
        public let language: LanguageName
    }
    
    @MemberwiseInit(.public)
    public struct FlavorText: Codable, Hashable {
        public let text: String
        public let versionGroup: VersionGroupName
        public let language: LanguageName
    }
    
    @MemberwiseInit(.public)
    public struct GenerationGameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let generation: GenerationName
    }
    
    @MemberwiseInit(.public)
    public struct Sprites: Codable, Hashable {
        public let `default`: String
    }
    
    @MemberwiseInit(.public)
    public struct HeldPokemon: Codable, Hashable {
        public let pokemon: PokemonName
        public let versionDetails: [VersionDetail]
        
        @MemberwiseInit(.public)
        public struct VersionDetail: Codable, Hashable {
            public let rarity: Int
            public let version: VersionName
        }
    }
}

// Domain model for ItemAttribute
@MemberwiseInit(.public)
public struct ItemAttribute: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemAttributeName
    public let items: [ItemName]
    public let names: [Name]
    public let descriptions: [Description]
}

// Domain model for ItemCategory
@MemberwiseInit(.public)
public struct ItemCategory: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemCategoryName
    public let items: [ItemName]
    public let names: [Name]
    public let pocket: ItemPocketName
}

// Domain model for ItemFlingEffect
@MemberwiseInit(.public)
public struct ItemFlingEffect: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemFlingEffectName
    public let effectEntries: [Effect]
    public let items: [ItemName]
    
    @MemberwiseInit(.public)
    public struct Effect: Codable, Hashable {
        public let effect: String
        public let language: LanguageName
    }
}

// Domain model for ItemPocket
@MemberwiseInit(.public)
public struct ItemPocket: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemPocketName
    public let categories: [ItemCategoryName]
    public let names: [Name]
}
