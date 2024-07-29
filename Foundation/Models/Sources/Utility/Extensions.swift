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

extension ModelsAsset: @unchecked Sendable {}

public func pokemonRed() -> Color {
    return Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(red: 0.83, green: 0.33, blue: 0.29, alpha: 1.0)
        } else {
            return UIColor(red: 0.91, green: 0.45, blue: 0.39, alpha: 1.0)
        }
    })
}

extension String {
    public var cleaned: String {
        self.replacingOccurrences(of: "\u{0C}", with: " ").replacingOccurrences(of: "\n", with: " ")
    }
}
