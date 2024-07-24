import Foundation
import SwiftUI

public struct PokemonType: Codable, Hashable {
    public struct TypeDetail: Codable, Hashable {
        public let name: String
        public let url: URL
    }

    public let slot: Int
    public let type: TypeDetail
}

extension PokemonType {
    public var backgroundColor: Color {
        type.backgroundColor
    }
    
    public var image: Image {
        type.typeDetailName.icon
    }
}

extension PokemonType.TypeDetail {
    public var typeDetailName: TypeDetailName {
        return TypeDetailName(rawValue: name.lowercased()) ?? .unknown
    }
    public var backgroundColor: Color {
        typeDetailName.color()
    }
}
