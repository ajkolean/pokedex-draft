// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonCardView.swift
import ComposableArchitecture
import Models
import SwiftUI

struct PokemonCardView: View {
    let pokemon: PokemonShort
    
    init(pokemon: PokemonShort) {
        self.pokemon = pokemon
    }
    
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
                    Spacer()
                        .frame(width: 100, height: 24)
                    
                    
                    AsyncImage(
                        url: URL(string: pokemon.imageURL)!,
                        transaction: .init(animation: .easeInOut)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .padding([.bottom, .trailing], 8)
                            } else if let error = phase.error {
                                Text("Error: \(error.localizedDescription)")
                            } else {
                                ProgressView()
                                    .frame(width: 60, height: 60)
                                    .padding([.bottom, .trailing], 8)
                            }
                        }
                }
            }
        }
        .background(Color.mint)
        .cornerRadius(12)
        .shadow(color: Color.mint, radius: 4, x: 1.0, y: 1.0)
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
