import SwiftUI

public enum TypeDetailName: String, Codable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case stellar
    case unknown

    public var backgroundColor: Color {
        switch self {
        case .normal:
            return .gray
        case .fighting:
            return .red
        case .flying:
            return .blue
        case .poison:
            return .purple
        case .ground:
            return .brown
        case .rock:
            return Color(UIColor.systemGray2)
        case .bug:
            return .green
        case .ghost:
            return .indigo
        case .steel:
            return Color(UIColor.systemGray3)
        case .fire:
            return .red
        case .water:
            return .cyan
        case .grass:
            return .green
        case .electric:
            return .yellow
        case .psychic:
            return .pink
        case .ice:
            return .teal
        case .dragon:
            return .blue
        case .dark:
            return .black
        case .fairy:
            return .pink
        case .stellar:
            return .purple
        case .unknown:
            return Color(UIColor.systemGray4)
        }
    }
}

extension TypeDetailName {
    public func color() -> Color {
        return Color(UIColor { traitCollection in
            switch self {
            case .normal:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 128 / 255,
                    green: 128 / 255,
                    blue: 85 / 255,
                    alpha: 1.0
                ) : UIColor(red: 168 / 255, green: 167 / 255, blue: 122 / 255, alpha: 1.0)
            case .fire:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 238 / 255,
                    green: 81 / 255,
                    blue: 48 / 255,
                    alpha: 1.0
                ) : UIColor(red: 238 / 255, green: 129 / 255, blue: 48 / 255, alpha: 1.0)
            case .water:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 63 / 255,
                    green: 144 / 255,
                    blue: 240 / 255,
                    alpha: 1.0
                ) : UIColor(red: 99 / 255, green: 144 / 255, blue: 240 / 255, alpha: 1.0)
            case .electric:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 247 / 255,
                    green: 208 / 255,
                    blue: 44 / 255,
                    alpha: 1.0
                ) : UIColor(red: 247 / 255, green: 208 / 255, blue: 44 / 255, alpha: 1.0)
            case .grass:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 80 / 255,
                    green: 150 / 255,
                    blue: 50 / 255,
                    alpha: 1.0
                ) : UIColor(red: 122 / 255, green: 199 / 255, blue: 76 / 255, alpha: 1.0)
            case .ice:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 150 / 255,
                    green: 210 / 255,
                    blue: 210 / 255,
                    alpha: 1.0
                ) : UIColor(red: 150 / 255, green: 217 / 255, blue: 214 / 255, alpha: 1.0)
            case .fighting:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 194 / 255,
                    green: 46 / 255,
                    blue: 40 / 255,
                    alpha: 1.0
                ) : UIColor(red: 194 / 255, green: 46 / 255, blue: 40 / 255, alpha: 1.0)
            case .poison:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 163 / 255,
                    green: 62 / 255,
                    blue: 161 / 255,
                    alpha: 1.0
                ) : UIColor(red: 163 / 255, green: 62 / 255, blue: 161 / 255, alpha: 1.0)
            case .ground:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 194 / 255,
                    green: 143 / 255,
                    blue: 81 / 255,
                    alpha: 1.0
                ) : UIColor(red: 226 / 255, green: 191 / 255, blue: 101 / 255, alpha: 1.0)
            case .flying:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 169 / 255,
                    green: 143 / 255,
                    blue: 243 / 255,
                    alpha: 1.0
                ) : UIColor(red: 169 / 255, green: 143 / 255, blue: 243 / 255, alpha: 1.0)
            case .psychic:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 249 / 255,
                    green: 85 / 255,
                    blue: 135 / 255,
                    alpha: 1.0
                ) : UIColor(red: 249 / 255, green: 85 / 255, blue: 135 / 255, alpha: 1.0)
            case .bug:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 166 / 255,
                    green: 185 / 255,
                    blue: 26 / 255,
                    alpha: 1.0
                ) : UIColor(red: 166 / 255, green: 185 / 255, blue: 26 / 255, alpha: 1.0)
            case .rock:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 182 / 255,
                    green: 161 / 255,
                    blue: 54 / 255,
                    alpha: 1.0
                ) : UIColor(red: 182 / 255, green: 161 / 255, blue: 54 / 255, alpha: 1.0)
            case .ghost:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 115 / 255,
                    green: 87 / 255,
                    blue: 151 / 255,
                    alpha: 1.0
                ) : UIColor(red: 115 / 255, green: 87 / 255, blue: 151 / 255, alpha: 1.0)
            case .dragon:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 111 / 255,
                    green: 53 / 255,
                    blue: 252 / 255,
                    alpha: 1.0
                ) : UIColor(red: 111 / 255, green: 53 / 255, blue: 252 / 255, alpha: 1.0)
            case .dark:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 112 / 255,
                    green: 88 / 255,
                    blue: 70 / 255,
                    alpha: 1.0
                ) : UIColor(red: 112 / 255, green: 88 / 255, blue: 70 / 255, alpha: 1.0)
            case .steel:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 183 / 255,
                    green: 183 / 255,
                    blue: 206 / 255,
                    alpha: 1.0
                ) : UIColor(red: 183 / 255, green: 183 / 255, blue: 206 / 255, alpha: 1.0)
            case .fairy:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 214 / 255,
                    green: 133 / 255,
                    blue: 173 / 255,
                    alpha: 1.0
                ) : UIColor(red: 214 / 255, green: 133 / 255, blue: 173 / 255, alpha: 1.0)
            case .stellar:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 184 / 255,
                    green: 104 / 255,
                    blue: 212 / 255,
                    alpha: 1.0
                ) : UIColor(red: 184 / 255, green: 104 / 255, blue: 212 / 255, alpha: 1.0)
            case .unknown:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 104 / 255,
                    green: 160 / 255,
                    blue: 144 / 255,
                    alpha: 1.0
                ) : UIColor(red: 104 / 255, green: 160 / 255, blue: 144 / 255, alpha: 1.0)
            }
        })
    }
}
