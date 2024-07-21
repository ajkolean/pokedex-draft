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
            return .orange
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

