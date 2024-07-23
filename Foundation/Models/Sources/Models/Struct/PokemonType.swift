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
}

extension PokemonType.TypeDetail {
    public var backgroundColor: Color {
        guard let typeName = TypeDetailName(rawValue: name.lowercased()) else {
            return .gray
        }
        return typeName.color()
    }
}
