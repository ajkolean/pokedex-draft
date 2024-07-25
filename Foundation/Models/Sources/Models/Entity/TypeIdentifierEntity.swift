import Foundation
import SwiftData

@Model
public class TypeIdentifierEntity {
    @Attribute(.unique)
    public var name: String
    public var url: URL

    public init(name: String, url: URL) {
        self.name = name
        self.url = url
    }

    public var asModel: TypeIdentifier {
        .init(name: name, url: url)
    }

    public convenience init(_ identifier: TypeIdentifier) {
        self.init(name: identifier.name, url: identifier.url)
    }
}
