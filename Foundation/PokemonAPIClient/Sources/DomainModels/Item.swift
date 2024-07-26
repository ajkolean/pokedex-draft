import Foundation

// Domain model for Item
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
    
    public struct VerboseEffect: Codable, Hashable {
        public let effect: String
        public let shortEffect: String
        public let language: LanguageName
    }
    
    public struct FlavorText: Codable, Hashable {
        public let text: String
        public let versionGroup: VersionGroupName
        public let language: LanguageName
    }
    
    public struct GenerationGameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let generation: GenerationName
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
    
    public struct Sprites: Codable, Hashable {
        public let `default`: String
    }
    
    public struct HeldPokemon: Codable, Hashable {
        public let pokemon: PokemonName
        public let versionDetails: [VersionDetail]
        
        public struct VersionDetail: Codable, Hashable {
            public let rarity: Int
            public let version: VersionName
        }
    }
}

// Domain model for ItemAttribute
public struct ItemAttribute: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemAttributeName
    public let items: [ItemName]
    public let names: [Name]
    public let descriptions: [Description]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
    
    public struct Description: Codable, Hashable {
        public let description: String
        public let language: LanguageName
    }
}

// Domain model for ItemCategory
public struct ItemCategory: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemCategoryName
    public let items: [ItemName]
    public let names: [Name]
    public let pocket: ItemPocketName
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for ItemFlingEffect
public struct ItemFlingEffect: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemFlingEffectName
    public let effectEntries: [Effect]
    public let items: [ItemName]
    
    public struct Effect: Codable, Hashable {
        public let effect: String
        public let language: LanguageName
    }
}

// Domain model for ItemPocket
public struct ItemPocket: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: ItemPocketName
    public let categories: [ItemCategoryName]
    public let names: [Name]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension Item {
    init(apiModel: ItemResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.cost = apiModel.cost
        self.flingPower = apiModel.fling_power
        self.flingEffect = apiModel.fling_effect?.name
        self.attributes = apiModel.attributes.map { $0.name }
        self.category = apiModel.category.name
        self.effectEntries = apiModel.effect_entries.map { VerboseEffect(effect: $0.effect, shortEffect: $0.short_effect, language: LanguageName(rawValue: $0.language.name)) }
        self.flavorTextEntries = apiModel.flavor_text_entries.map { FlavorText(text: $0.text, versionGroup: VersionGroupName(rawValue: $0.version_group.name), language: LanguageName(rawValue: $0.language.name)) }
        self.gameIndices = apiModel.game_indices.map { GenerationGameIndex(gameIndex: $0.game_index, generation: GenerationName(rawValue: $0.generation.name)) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.sprites = Sprites(default: apiModel.sprites.default)
        self.heldByPokemon = apiModel.held_by_pokemon.map { HeldPokemon(pokemon: PokemonName(rawValue: $0.pokemon.name), versionDetails: $0.version_details.map { HeldPokemon.VersionDetail(rarity: $0.rarity, version: VersionName(rawValue: $0.version.name)) }) }
        self.babyTriggerFor = apiModel.baby_trigger_for?.url
    }
}

extension ItemAttribute {
    init(apiModel: ItemAttributeResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.items = apiModel.items.map { ItemName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.descriptions = apiModel.descriptions.map { Description(description: $0.description, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension ItemCategory {
    init(apiModel: ItemCategoryResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.items = apiModel.items.map { ItemName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        self.pocket = ItemPocketName(rawValue: apiModel.pocket.name)
    }
}

extension ItemFlingEffect {
    init(apiModel: ItemFlingEffectResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.effectEntries = apiModel.effect_entries.map { Effect(effect: $0.effect, language: LanguageName(rawValue: $0.language.name)) }
        self.items = apiModel.items.map { ItemName(rawValue: $0.name) }
    }
}

extension ItemPocket {
    init(apiModel: ItemPocketResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.categories = apiModel.categories.map { ItemCategoryName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}
