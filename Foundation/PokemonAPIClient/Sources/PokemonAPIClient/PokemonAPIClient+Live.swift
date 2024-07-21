// Foundation/PokemonAPIClient/Sources/PokemonAPIClient/PokemonAPIClient+Live.swift

import ComposableArchitecture
import Foundation
import Models
import PokemonAPIClientInterface

extension PokemonAPIClient: DependencyKey {
    private static let baseURL = "https://pokeapi.co/api/v2/"
    public static let liveValue: PokemonAPIClient = {
        let client = PokemonAPIClient(
            fetchPokemonList: {
                let url = URL(string: "\(baseURL)pokemon?offset=0&limit=1302")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let listResponse = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                let pokemons = try listResponse.results.map { basic in
                    let id = try extractID(from: basic.url)
                    return PokemonShort(id: id, name: basic.name)
                }
                return pokemons
            },
            fetchPokemonDetails: { id in
                guard let url = URL(string: "\(baseURL)pokemon\(id)") else {
                    throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL format"])
                }
                let (data, _) = try await URLSession.shared.data(from: url)
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                return pokemon
            }
        )
        return client
    }()

    private static let idExtractionRegex = try! NSRegularExpression(pattern: "/pokemon/(\\d+)/")

    private static func extractID(from url: String) throws -> Int {
        let nsString = url as NSString
        let results = idExtractionRegex.matches(in: url, range: NSRange(location: 0, length: nsString.length))

        guard let match = results.first else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL format"])
        }

        let idString = nsString.substring(with: match.range(at: 1))
        guard let id = Int(idString) else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid ID format"])
        }

        return id
    }
}
