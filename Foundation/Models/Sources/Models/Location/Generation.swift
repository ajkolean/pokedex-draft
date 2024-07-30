import Foundation
import MemberwiseInit

// MARK: - Pokemon

@MemberwiseInit(.public)
public struct Generation: Hashable, Codable, Identifiable, Sendable {
    public typealias Name = Identifier<String>
    public typealias ID = Identifier<Int>
    
    public var id: ID {
        get { ID(rawValue: _id) }
    }
    
    public var name: Name {
        get { Name(rawValue: _name) }
    }
    
    public let _id: Int
    public let _name: String
}
