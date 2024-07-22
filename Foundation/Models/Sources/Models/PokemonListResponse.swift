// Foundation/Models/Sources/Models/PokemonShort.swift
import Foundation

public struct PokemonListResponse: Decodable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [PokemonBasicResponse]
}

public struct PokemonBasicResponse: Codable {
    public let name: String
    public let url: URL
}
