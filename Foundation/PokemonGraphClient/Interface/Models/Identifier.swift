
import Foundation

public protocol IdentifierProtocol: RawRepresentable, Codable, Hashable, Identifiable, Sendable, CustomStringConvertible {}

extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }
}

extension IdentifierProtocol where Self: ExpressibleByStringLiteral, RawValue == String {
    public var id: String { rawValue }
}

extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
    public init(integerLiteral value: Int) {
        self.init(rawValue: value)!
    }
}

extension IdentifierProtocol where Self: ExpressibleByIntegerLiteral, RawValue == Int {
    public var id: Int { rawValue }
}

extension IdentifierProtocol where Self: RawRepresentable {
    public var description: String {
        "\(rawValue)"
    }
}


