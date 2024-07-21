import Foundation

// Move to Utilies framework later?
public actor ActorIsolation<Value> {
    private var _value: Value

    public init(_ value: Value) {
        _value = value
    }

    public var value: Value {
        get async {
            return _value
        }
    }

    public func set(_ newValue: Value) async {
        _value = newValue
    }

    public func update(_ transform: @escaping (inout Value) -> Void) async {
        transform(&_value)
    }
}
