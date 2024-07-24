import Foundation
import SwiftUI

public struct TypeIdentifier: Codable, Identifiable, Hashable, Sendable {
    public var id: Int
    // TypeDetailName enum here instead
    public var name: String
    public var url: URL

    public init(id: Int, name: String, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
}

extension TypeIdentifier {
    public var typeDetail: TypeDetailName {
        .init(rawValue: name) ?? .unknown
    }
}
