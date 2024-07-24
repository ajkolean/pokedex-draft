import Foundation

public struct TypeIdentifier: Codable, Identifiable, Hashable, Sendable {
    public var id: Int
    public var name: String
    public var url: URL
    
    public init(id: Int, name: String, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
}
