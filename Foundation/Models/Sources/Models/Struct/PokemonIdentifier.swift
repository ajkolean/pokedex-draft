// Foundation/Models/Sources/Models/PokemonIdentifier.swift
import Foundation
import SwiftData

public typealias PokemonName = String

public struct PokemonIdentifier: Codable, Identifiable, Hashable, Sendable {
    public var id: Int
    public var name: PokemonName
    public var url: URL

    public init(id: Int, name: PokemonName, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
}

extension PokemonIdentifier {
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }

    public var asEntity: PokemonIdentifierEntity {
        .init(id: id, name: name, url: url)
    }
}

#if DEBUG
    extension PokemonIdentifier {
        public static let mockData: [PokemonIdentifier] = [
            //            PokemonIdentifier(id: 1, name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
//            PokemonIdentifier(id: 2, name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
//            PokemonIdentifier(id: 3, name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
//            PokemonIdentifier(id: 4, name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
//            PokemonIdentifier(id: 5, name: "charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5/"),
//            PokemonIdentifier(id: 6, name: "charizard", url: "https://pokeapi.co/api/v2/pokemon/6/"),
//            PokemonIdentifier(id: 7, name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/"),
//            PokemonIdentifier(id: 8, name: "wartortle", url: "https://pokeapi.co/api/v2/pokemon/8/"),
//            PokemonIdentifier(id: 9, name: "blastoise", url: "https://pokeapi.co/api/v2/pokemon/9/"),
//            PokemonIdentifier(id: 10, name: "caterpie", url: "https://pokeapi.co/api/v2/pokemon/10/"),
//            PokemonIdentifier(id: 11, name: "metapod", url: "https://pokeapi.co/api/v2/pokemon/11/"),
//            PokemonIdentifier(id: 12, name: "butterfree", url: "https://pokeapi.co/api/v2/pokemon/12/"),
//            PokemonIdentifier(id: 13, name: "weedle", url: "https://pokeapi.co/api/v2/pokemon/13/"),
//            PokemonIdentifier(id: 14, name: "kakuna", url: "https://pokeapi.co/api/v2/pokemon/14/"),
//            PokemonIdentifier(id: 15, name: "beedrill", url: "https://pokeapi.co/api/v2/pokemon/15/"),
//            PokemonIdentifier(id: 16, name: "pidgey", url: "https://pokeapi.co/api/v2/pokemon/16/"),
//            PokemonIdentifier(id: 17, name: "pidgeotto", url: "https://pokeapi.co/api/v2/pokemon/17/"),
//            PokemonIdentifier(id: 18, name: "pidgeot", url: "https://pokeapi.co/api/v2/pokemon/18/"),
//            PokemonIdentifier(id: 19, name: "rattata", url: "https://pokeapi.co/api/v2/pokemon/19/"),
//            PokemonIdentifier(id: 20, name: "raticate", url: "https://pokeapi.co/api/v2/pokemon/20/"),
        ]
    }
#endif
