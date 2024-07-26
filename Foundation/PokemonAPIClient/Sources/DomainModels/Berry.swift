import Foundation

// Domain model for Berry
public struct Berry: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: BerryName
    public let growthTime: Int
    public let maxHarvest: Int
    public let size: Int
    public let firmness: String
    public let flavors: [Flavor]
    public let item: ItemName
    public let naturalGiftType: TypeName
    
    public struct Flavor: Codable, Hashable {
        public let name: String
        public let potency: Int
    }
}

// Domain model for BerryFirmness
public struct BerryFirmness: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: BerryFirmnessName
    public let berries: [BerryName]
    public let names: [Name]
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

// Domain model for BerryFlavor
public struct BerryFlavor: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: BerryFlavorName
    public let berries: [FlavorBerryMap]
    public let contestType: ContestTypeName
    public let names: [Name]
    
    public struct FlavorBerryMap: Codable, Hashable {
        public let potency: Int
        public let berry: BerryName
    }
    
    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension Berry {
    init(apiModel: BerryResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.growthTime = apiModel.growth_time
        self.maxHarvest = apiModel.max_harvest
        self.size = apiModel.size
        self.firmness = apiModel.firmness.name
        self.flavors = apiModel.flavors.map { Flavor(name: $0.flavor.name, potency: $0.potency) }
        self.item = ItemName(rawValue: apiModel.item.name)
        self.naturalGiftType = TypeName(rawValue: apiModel.natural_gift_type.name)
    }
}

extension BerryFirmness {
    init(apiModel: BerryFirmnessResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.berries = apiModel.berries.map { BerryName(rawValue: $0.name) }
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}

extension BerryFlavor {
    init(apiModel: BerryFlavorResponse) {
        self.id = apiModel.id
        self.name = apiModel.name
        self.berries = apiModel.berries.map { FlavorBerryMap(potency: $0.potency, berry: BerryName(rawValue: $0.berry.name)) }
        self.contestType = ContestTypeName(rawValue: apiModel.contest_type.name)
        self.names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
    }
}
