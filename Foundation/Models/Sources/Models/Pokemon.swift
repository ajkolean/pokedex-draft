// Foundation/Models/Sources/Models/PokemonShort.swift
import Foundation


public struct Pokemon: Codable, Identifiable, Hashable {
    public var id: Int { order }
    
    public let order: Int
    public let name: String
    public let types: [PokemonType]
    
    public let height: Int
    public let weight: Int
}
