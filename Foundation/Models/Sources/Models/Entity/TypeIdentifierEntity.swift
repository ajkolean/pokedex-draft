import Foundation
import SwiftData

@Model
public class TypeIdentifierEntity {
    public var id: Int
    @Attribute(.unique)
    public var name: String
    public var url: URL
    
    public init(id: Int, name: String, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
    
    public var asModel: TypeIdentifier {
        .init(id: id, name: name, url: url)
    }
    
    public convenience init (_ identifier: TypeIdentifier) {
        self.init(id: identifier.id, name: identifier.name, url: identifier.url)
    }
}
