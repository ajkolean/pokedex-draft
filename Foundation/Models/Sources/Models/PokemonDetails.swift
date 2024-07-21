// Foundation/Models/Sources/Models/PokemonDetails.swift
import Foundation
import SwiftUI

public struct PokemonDetails: Codable, Identifiable, Hashable {
    public var id: Int { order }

    public let order: Int
    public let name: String
    public let types: [PokemonType]

    public let height: Int
    public let weight: Int

    public var backgroundColor: Color {
        let type = types.first(where: { $0.slot == 2 }) ?? types.first
        return type?.type.backgroundColor ?? .gray
    }
}
