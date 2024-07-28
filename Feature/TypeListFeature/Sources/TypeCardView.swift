// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonCardView.swift
import ComposableArchitecture
import PokemonGraphClientInterface
import Models
import SwiftUI

struct TypeCardView: View {
    let pokemonType: PokemonType

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()

                    pokemonType
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
                Text(pokemonType.type.rawValue.capitalized)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 12)
                    .padding(.bottom, 16)
                    .padding(.leading)
                Spacer()
            }
        }
        .background(pokemonType.type.color())
        .cornerRadius(12)
        .shadow(color: pokemonType.type.color(), radius: 4, x: 1.0, y: 1.0)
    }
}
