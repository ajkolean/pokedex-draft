// Foundation/Models/Sources/Models/PokemonDetails.swift
import Foundation
import SwiftUI

public struct PokemonDetails: Codable, Hashable, Identifiable {
//    public let abilities: [PokemonAbility]
    public let baseExperience: Int
//    public let cries: PokemonCry
//    public let forms: [PokemonForm]
    public let height: Int
    public let id: Int
//    public let isDefault: Bool
//    public let locationAreaEncounters: URL
//    public let moves: [Move]
    public let name: PokemonName
    public let order: Int
    public let species: PokemonForm
    public let stats: [Stat]
    public let types: [PokemonDetailsType]
    public let weight: Int

    enum CodingKeys: String, CodingKey {
//        case abilities
        case baseExperience = "base_experience"
//        case cries
//        case forms
        case height
        case id
//        case isDefault = "is_default"
//        case locationAreaEncounters = "location_area_encounters"
//        case moves
        case name
        case order
        case species
        case stats
        case types
        case weight
    }
}

extension PokemonDetails {
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }

    public var shinyImageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/\(id).png"
    }

    public var primaryType: PokemonDetailsType? {
        types.first(where: { $0.slot == 1 }) ?? types.first
    }

    public var secondaryType: PokemonDetailsType? {
        types.first(where: { $0.slot == 2 })
    }

    public var backgroundColor: Color {
        primaryType?.type.backgroundColor ?? .gray
    }

    public var asEntity: PokemonDetailsEntity {
        .init(
            baseExperience: baseExperience,
            height: height,
            id: id,
            name: name,
            order: order,
            species: species,
            stats: stats,
            types: types,
            weight: weight
        )
    }
}
