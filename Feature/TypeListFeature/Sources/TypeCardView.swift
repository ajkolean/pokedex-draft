// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonCardView.swift
import ComposableArchitecture
import Kingfisher
import Models
import SwiftUI

struct TypeCardView: View {
    let identifier: TypeIdentifier

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()

                    identifier
                        .type
                        .icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .opacity(0.5)
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)
                }
            }
            HStack {
                Text(identifier.name.capitalized)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 12)
                    .padding(.bottom, 16)
                    .padding(.leading)
                Spacer()
            }
        }
        .background(identifier.type.color())
        .cornerRadius(12)
        .shadow(color: identifier.type.color(), radius: 4, x: 1.0, y: 1.0)
    }
}
