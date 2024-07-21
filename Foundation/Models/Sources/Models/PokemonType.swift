import Foundation

public struct TypeDetail: Codable, Hashable {
    public let name: String
    public let url: String

    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

public struct PokemonType: Codable, Hashable {
    public let slot: Int
    public let type: TypeDetail

    public init(slot: Int, type: TypeDetail) {
        self.slot = slot
        self.type = type
    }
}
