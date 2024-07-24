// Foundation/Models/Sources/Models/PokemonShort.swift
import Foundation

public struct NameListResponse: Decodable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [NamedAPIResource]
}
