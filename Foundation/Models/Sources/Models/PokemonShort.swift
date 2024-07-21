// Foundation/Models/Sources/Models/PokemonShort.swift
import Foundation

public struct PokemonShort: Codable, Identifiable, Hashable {
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }

    public var id: Int
    public var name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

#if DEBUG
    extension PokemonShort {
        public static let mockData: [PokemonShort] = [
            PokemonShort(id: 1, name: "bulbasaur"),
            PokemonShort(id: 2, name: "ivysaur"),
            PokemonShort(id: 3, name: "venusaur"),
            PokemonShort(id: 4, name: "charmander"),
            PokemonShort(id: 5, name: "charmeleon"),
            PokemonShort(id: 6, name: "charizard"),
            PokemonShort(id: 7, name: "squirtle"),
            PokemonShort(id: 8, name: "wartortle"),
            PokemonShort(id: 9, name: "blastoise"),
            PokemonShort(id: 10, name: "caterpie"),
            PokemonShort(id: 11, name: "metapod"),
            PokemonShort(id: 12, name: "butterfree"),
            PokemonShort(id: 13, name: "weedle"),
            PokemonShort(id: 14, name: "kakuna"),
            PokemonShort(id: 15, name: "beedrill"),
            PokemonShort(id: 16, name: "pidgey"),
            PokemonShort(id: 17, name: "pidgeotto"),
            PokemonShort(id: 18, name: "pidgeot"),
            PokemonShort(id: 19, name: "rattata"),
            PokemonShort(id: 20, name: "raticate"),
        ]
    }

#endif
