// Feature/PokemonListFeature/Sources/Pokemon.swift
import ComposableArchitecture
import Foundation

public struct Pokemon: Decodable, Identifiable, Equatable {
    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension Pokemon {
    public static let mockData: IdentifiedArrayOf<Pokemon> = [
        Pokemon(id: 1, name: "bulbasaur"),
        Pokemon(id: 2, name: "ivysaur"),
        Pokemon(id: 3, name: "venusaur"),
        Pokemon(id: 4, name: "charmander"),
        Pokemon(id: 5, name: "charmeleon"),
        Pokemon(id: 6, name: "charizard"),
        Pokemon(id: 7, name: "squirtle"),
        Pokemon(id: 8, name: "wartortle"),
        Pokemon(id: 9, name: "blastoise"),
        Pokemon(id: 10, name: "caterpie"),
        Pokemon(id: 11, name: "metapod"),
        Pokemon(id: 12, name: "butterfree"),
        Pokemon(id: 13, name: "weedle"),
        Pokemon(id: 14, name: "kakuna"),
        Pokemon(id: 15, name: "beedrill"),
        Pokemon(id: 16, name: "pidgey"),
        Pokemon(id: 17, name: "pidgeotto"),
        Pokemon(id: 18, name: "pidgeot"),
        Pokemon(id: 19, name: "rattata"),
        Pokemon(id: 20, name: "raticate"),
    ]
}
