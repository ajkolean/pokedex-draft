import Foundation
import SwiftUI

public struct PokemonType: Codable, Hashable {
    public let slot: Int
    public let type: TypeDetail

    public init(slot: Int, type: TypeDetail) {
        self.slot = slot
        self.type = type
    }

    public var backgroundColor: Color {
        type.backgroundColor
    }
}

public struct TypeDetail: Codable, Hashable {
    public let name: String
    public let url: String

    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

extension TypeDetail {
    public var backgroundColor: Color {
        guard let typeName = TypeDetailName(rawValue: name.lowercased()) else {
            return .gray
        }
        return typeName.color()
    }
}
