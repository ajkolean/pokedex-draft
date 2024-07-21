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

    public var primaryType: PokemonType? {
        types.first(where: { $0.slot == 1 }) ?? types.first
    }

    public var backgroundColor: Color {
        primaryType?.type.backgroundColor ?? .gray
    }
}
