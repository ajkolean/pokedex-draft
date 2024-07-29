import Foundation
import SwiftUI
import Models

public enum MenuItem: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case pokedex
    case moves
    case abilities
    case items
    case locations
    case types

    public var title: String {
        switch self {
        case .pokedex:
            return "Pokédex"
        case .moves, .abilities, .items, .locations, .types:
            return rawValue.capitalized
        }
    }

    public var color: Color {
        switch self {
        case .pokedex:
            return .green
        case .moves:
            return .red
        case .abilities:
            return .blue
        case .items:
            return .yellow
        case .locations:
            return .purple
        case .types:
            return .brown
        }
    }
}

struct BottomRoundedRectangle: Shape {
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct MenuCardView: View {
    var item: MenuItem

    var body: some View {
        ZStack {
            item.color
                .cornerRadius(15)
                .shadow(color: item.color, radius: 4, x: 1.0, y: 1.0)

            HStack {
                Spacer()
                VStack {
                    Spacer()
                    ModelsAsset
                        .spinningball
                        .swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.2)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(width: 70, height: 70)
                        .offset(x: 10, y: 10)
                        .clipped()
                }
            }

            HStack {
                Text(item.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                Spacer()
            }
        }
        .padding(4)
    }
}
