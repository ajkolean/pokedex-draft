// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonCardView.swift
import ComposableArchitecture
import Models
import SwiftUI
import Kingfisher

struct PokemonCardView: View {
    let pokemon: PokemonIdentifier
    let details: PokemonDetails?

    @Dependency(\.pokemonAPIClient) var pokemonAPIClient

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading)

                    Text(formattedId)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading, 2)
                }

                HStack {
                    Text(details?.types.first?.type.name ?? "")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)

                    KFImage(URL(string: pokemon.imageURL))
                        .placeholder { value in
                            ProgressView(value: value.fractionCompleted)
                        }
                        .fade(duration: 0.25)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding([.bottom, .trailing], 8)
                }
            }
        }
        .background(details?.backgroundColor ?? .gray)
        .cornerRadius(12)
        .shadow(color: details?.backgroundColor ?? .gray, radius: 4, x: 1.0, y: 1.0)
    }

    var formattedId: String {
        if pokemon.id / 10 < 1 {
            return "#00\(pokemon.id)"
        } else if pokemon.id / 10 < 10 {
            return "#0\(pokemon.id)"
        } else {
            return "#\(pokemon.id)"
        }
    }
}
