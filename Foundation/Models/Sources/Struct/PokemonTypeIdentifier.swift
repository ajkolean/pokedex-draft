import Foundation
import SwiftUI

public struct TypeIdentifier: Codable, Identifiable, Hashable, Sendable {
    public var id: String { name }

    public var name: String
    public var url: URL

    public init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
}

extension TypeIdentifier {
    public var type: PokemonType {
        .init(rawValue: name) ?? .unknown
    }
}
