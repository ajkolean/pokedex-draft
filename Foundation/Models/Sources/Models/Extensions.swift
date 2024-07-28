import SwiftUI

public struct TappableModifier: ViewModifier {
    public let action: () -> Void

    public func body(content: Content) -> some View {
        Button(action: action) {
            content
        }
        .buttonStyle(PlainButtonStyle())
    }
}

extension View {
    public func tappable(action: @escaping () -> Void) -> some View {
        modifier(TappableModifier(action: action))
    }
}

extension View {
    @ViewBuilder
    public func unWrapping<T>(_ value: T?, apply: (Self, T) -> some View) -> some View {
        if let value {
            apply(self, value)
        } else {
            self
        }
    }
}
