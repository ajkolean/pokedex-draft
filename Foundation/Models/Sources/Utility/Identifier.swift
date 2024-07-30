//import Foundation
//
//public protocol IdentifierProtocol: RawRepresentable, Codable, Hashable, Identifiable, Sendable, CustomStringConvertible {}
//
//extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
//    public init(stringLiteral value: String) {
//        self.init(rawValue: value)!
//    }
//}
//
//extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
//    public var id: String { rawValue }
//}
//
//extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
//    public init(integerLiteral value: Int) {
//        self.init(rawValue: value)!
//    }
//}
//
//extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
//    public var id: Int { rawValue }
//}
//
//extension IdentifierProtocol where Self: RawRepresentable {
//    public var description: String {
//        "\(rawValue)"
//    }
//}
import Foundation

public protocol IdentifierProtocol: RawRepresentable, Codable, Hashable, Identifiable, Sendable, CustomStringConvertible {}

extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }
    
    public var id: String { rawValue }
}

extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
    public init(integerLiteral value: Int) {
        self.init(rawValue: value)!
    }
    
    public var id: Int { rawValue }
}

extension IdentifierProtocol where Self: RawRepresentable {
    public var description: String {
        "\(rawValue)"
    }
}

public struct Identifier<RawValue: Codable & Hashable & Sendable>: IdentifierProtocol {
    public let rawValue: RawValue
    
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    public var id: RawValue {
        return rawValue
    }
}

extension Identifier: ExpressibleByStringLiteral, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByUnicodeScalarLiteral where RawValue == String {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(rawValue: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(rawValue: value)
    }
}

extension Identifier: ExpressibleByIntegerLiteral where RawValue == Int {
    public init(integerLiteral value: Int) {
        self.init(rawValue: value)
    }
}
