//// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonCardView.swift
//import ComposableArchitecture
//import Kingfisher
//
//import Models
//import SwiftUI
//
//public struct PokemonCardView: View {
//    public var pokemon: PokemonSummary
//
//    public init(pokemon: PokemonSummary) {
//        self.pokemon = pokemon
//    }
//
//    var type: PokemonTypeEnum {
//        pokemon.types.first?.type ?? .unknown
//    }
//
//    public var body: some View {
//        ZStack {
//            VStack(alignment: .leading) {
//                HStack {
//                    Text(pokemon.name.rawValue.capitalized)
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding(.top, 10)
//                        .padding(.leading)
//
//                    Text(formattedId)
//                        .font(.subheadline)
//                        .foregroundColor(.white)
//                        .padding(.top, 10)
//                        .padding(.leading, 2)
//                }
//
//                HStack {
//                    Text(type.rawValue.capitalized)
//                        .font(.subheadline).bold()
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 8)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(Color.white.opacity(0.25))
//                        )
//                        .frame(width: 100, height: 24)
//
//                    KFImage(URL(string: pokemon.imageURL))
//                        .placeholder { value in
//                            ProgressView(value: value.fractionCompleted)
//                        }
//                        .fade(duration: 0.25)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 60, height: 60)
//                        .padding([.bottom, .trailing], 8)
//                }
//            }
//        }
//        .background(
//            type.color()
//        )
//        .cornerRadius(12)
//        .shadow(color: type.color(), radius: 4, x: 1.0, y: 1.0)
//    }
//
//    var formattedId: String {
//        if pokemon.id.rawValue / 10 < 1 {
//            return "#00\(pokemon.id.rawValue)"
//        } else if pokemon.id.rawValue / 10 < 10 {
//            return "#0\(pokemon.id.rawValue)"
//        } else {
//            return "#\(pokemon.id.rawValue)"
//        }
//    }
//}
