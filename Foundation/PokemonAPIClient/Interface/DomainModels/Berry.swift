import Foundation
import MemberwiseInit

// Domain model for Berry
@MemberwiseInit(.public)
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

    @MemberwiseInit(.public)
    public struct Flavor: Codable, Hashable {
        public let name: String
        public let potency: Int
    }
}

// Domain model for BerryFirmness
@MemberwiseInit(.public)
public struct BerryFirmness: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: BerryFirmnessName
    public let berries: [BerryName]
    public let names: [Name]
}

// Domain model for BerryFlavor
@MemberwiseInit(.public)
public struct BerryFlavor: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: BerryFlavorName
    public let berries: [FlavorBerryMap]
    public let contestType: ContestTypeName
    public let names: [Name]

    @MemberwiseInit(.public)
    public struct FlavorBerryMap: Codable, Hashable {
        public let potency: Int
        public let berry: BerryName
    }
}
