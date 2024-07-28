import Foundation

public struct EquatableError: Error, Equatable, CustomStringConvertible, LocalizedError, Hashable {
    public let base: Error
    
    public var description: String {
        return base.localizedDescription
    }
    
    public var errorDescription: String? {
        return base.localizedDescription
    }
    
    public init(_ base: Error) {
        self.base = base
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(type(of: base))")
        hasher.combine(base.localizedDescription)
    }
    
    public static func == (lhs: EquatableError, rhs: EquatableError) -> Bool {
        return type(of: lhs.base) == type(of: rhs.base) &&
        lhs.base.localizedDescription == rhs.base.localizedDescription
    }
}
