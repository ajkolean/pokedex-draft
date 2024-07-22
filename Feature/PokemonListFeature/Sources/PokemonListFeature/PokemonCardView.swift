// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonCardView.swift
import ComposableArchitecture
import Kingfisher
import Models
import SwiftUI

struct PokemonCardView: View {
    let identifier: PokemonIdentifier
    var pokemon: Pokemon?

    var pokemonDetails: PokemonDetails? {
        pokemon?.details
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(identifier.name.value.capitalized)
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
                    Text(pokemonDetails?.primaryType?.type.name.capitalized ?? "Grass")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                        .redacted(reason: pokemonDetails == nil ? .placeholder : [])

                    KFImage(URL(string: identifier.imageURL))
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
        .background(
            ZStack {
                if let pokemonDetails {
                    pokemonDetails.backgroundColor
                } else {
                    Color.gray
                        .blur(radius: 10)
                        .edgesIgnoringSafeArea(.all)
                }
            }
        )
        .cornerRadius(12)
        .shadow(color: pokemonDetails?.backgroundColor ?? .gray, radius: 4, x: 1.0, y: 1.0)
    }

    var formattedId: String {
        if identifier.id / 10 < 1 {
            return "#00\(identifier.id)"
        } else if identifier.id / 10 < 10 {
            return "#0\(identifier.id)"
        } else {
            return "#\(identifier.id)"
        }
    }
}
