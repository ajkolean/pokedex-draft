import Foundation
import Apollo

// MARK: - Pokemon

public struct Pokemon: Hashable, Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let height: Int?
    public let weight: Int?
    public let order: Int?
    public let baseExperience: Int?
    public let types: [PokemonTypeSlot]
    public let stats: [Stat]
    public let descriptions: [String]
    
    public // MARK: - PokemonType
    
    struct PokemonTypeSlot: Hashable, Codable, Sendable {
        public let slot: Int
        public let type: PokemonType
    }
    
    // MARK: - PokemonStat
    
    public struct Stat: Hashable, Codable, Sendable {
        public let baseStat: Int
        public let effort: Int
        public let name: String
    }
    
    public var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    public var primaryType: PokemonType {
        let type = types.first { $0.slot == 1 }
        return type?.type ?? .unknown
    }
}

extension Pokemon {
    init(_ apiModel: GraphClient.GetPokemonQuery.Data.Pokemon) {
        let types = apiModel.types.map { PokemonTypeSlot(slot: $0.slot, type: PokemonType(rawValue: $0.type?.name ?? "") ?? .unknown) }
        let stats = apiModel.stats.map { Stat(baseStat: $0.base_stat, effort: $0.effort, name: $0.statName?.name ?? "") }
        let descriptions = apiModel.species?.descriptions.map(\.text) ?? []
        self.init(
            id: apiModel.id,
            name: apiModel.name,
            height: apiModel.height,
            weight: apiModel.weight,
            order: apiModel.order,
            baseExperience: apiModel.baseExperience,
            types: types,
            stats: stats,
            descriptions: descriptions
        )
    }
}

import SwiftUI

public enum PokemonType: String, Codable, Sendable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case stellar
    case unknown
}

extension PokemonType {
    public var icon: Image {
        switch self {
        case .normal:
            return PokemonGraphClientInterfaceAsset.normalIcon.swiftUIImage
        case .fighting:
            return PokemonGraphClientInterfaceAsset.fightingIcn.swiftUIImage
        case .flying:
            return PokemonGraphClientInterfaceAsset.flyingIcon.swiftUIImage
        case .poison:
            return PokemonGraphClientInterfaceAsset.poisonIcon.swiftUIImage
        case .ground:
            return PokemonGraphClientInterfaceAsset.groundIcon.swiftUIImage
        case .rock:
            return PokemonGraphClientInterfaceAsset.rockIcon.swiftUIImage
        case .bug:
            return PokemonGraphClientInterfaceAsset.bugIcon.swiftUIImage
        case .ghost:
            return PokemonGraphClientInterfaceAsset.ghostIcon.swiftUIImage
        case .steel:
            return PokemonGraphClientInterfaceAsset.steelIcon.swiftUIImage
        case .fire:
            return PokemonGraphClientInterfaceAsset.fireIcon.swiftUIImage
        case .water:
            return PokemonGraphClientInterfaceAsset.waterIcon.swiftUIImage
        case .grass:
            return PokemonGraphClientInterfaceAsset.grassIcon.swiftUIImage
        case .electric:
            return PokemonGraphClientInterfaceAsset.electricIcon.swiftUIImage
        case .psychic:
            return PokemonGraphClientInterfaceAsset.psychicIcon.swiftUIImage
        case .ice:
            return PokemonGraphClientInterfaceAsset.iceIcon.swiftUIImage
        case .dragon:
            return PokemonGraphClientInterfaceAsset.dragonIcon.swiftUIImage
        case .dark:
            return PokemonGraphClientInterfaceAsset.darkIcon.swiftUIImage
        case .fairy:
            return PokemonGraphClientInterfaceAsset.fairyIcon.swiftUIImage
        case .stellar:
            return PokemonGraphClientInterfaceAsset.spinningball.swiftUIImage
        case .unknown:
            return PokemonGraphClientInterfaceAsset.spinningball.swiftUIImage
        }
    }
    
    public var pokemonImage: Image {
        switch self {
        case .normal:
            return PokemonGraphClientInterfaceAsset.normalCover.swiftUIImage
        case .fighting:
            return PokemonGraphClientInterfaceAsset.fightingCover.swiftUIImage
        case .flying:
            return PokemonGraphClientInterfaceAsset.flyingCover.swiftUIImage
        case .poison:
            return PokemonGraphClientInterfaceAsset.poisonCover.swiftUIImage
        case .ground:
            return PokemonGraphClientInterfaceAsset.groundCover.swiftUIImage
        case .rock:
            return PokemonGraphClientInterfaceAsset.rockCover.swiftUIImage
        case .bug:
            return PokemonGraphClientInterfaceAsset.bugCover.swiftUIImage
        case .ghost:
            return PokemonGraphClientInterfaceAsset.ghostCover.swiftUIImage
        case .steel:
            return PokemonGraphClientInterfaceAsset.steelCover.swiftUIImage
        case .fire:
            return PokemonGraphClientInterfaceAsset.fireCover.swiftUIImage
        case .water:
            return PokemonGraphClientInterfaceAsset.waterCover.swiftUIImage
        case .grass:
            return PokemonGraphClientInterfaceAsset.grassCover.swiftUIImage
        case .electric:
            return PokemonGraphClientInterfaceAsset.electricCover.swiftUIImage
        case .psychic:
            return PokemonGraphClientInterfaceAsset.psychicCover.swiftUIImage
        case .ice:
            return PokemonGraphClientInterfaceAsset.iceCover.swiftUIImage
        case .dragon:
            return PokemonGraphClientInterfaceAsset.dragonCover.swiftUIImage
        case .dark:
            return PokemonGraphClientInterfaceAsset.darkCover.swiftUIImage
        case .fairy:
            return PokemonGraphClientInterfaceAsset.fairyCover.swiftUIImage
        case .stellar:
            return PokemonGraphClientInterfaceAsset.spinningball.swiftUIImage
        case .unknown:
            return PokemonGraphClientInterfaceAsset.spinningball.swiftUIImage
        }
    }
    
    // swiftlint:disable:next function_body_length
    public func color() -> Color {
        return Color(UIColor { traitCollection in
            switch self {
            case .normal:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 128 / 255,
                    green: 128 / 255,
                    blue: 85 / 255,
                    alpha: 1.0
                ) : UIColor(red: 168 / 255, green: 167 / 255, blue: 122 / 255, alpha: 1.0)
            case .fire:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 238 / 255,
                    green: 81 / 255,
                    blue: 48 / 255,
                    alpha: 1.0
                ) : UIColor(red: 238 / 255, green: 129 / 255, blue: 48 / 255, alpha: 1.0)
            case .water:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 63 / 255,
                    green: 144 / 255,
                    blue: 240 / 255,
                    alpha: 1.0
                ) : UIColor(red: 99 / 255, green: 144 / 255, blue: 240 / 255, alpha: 1.0)
            case .electric:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 247 / 255,
                    green: 208 / 255,
                    blue: 44 / 255,
                    alpha: 1.0
                ) : UIColor(red: 247 / 255, green: 208 / 255, blue: 44 / 255, alpha: 1.0)
            case .grass:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 80 / 255,
                    green: 150 / 255,
                    blue: 50 / 255,
                    alpha: 1.0
                ) : UIColor(red: 122 / 255, green: 199 / 255, blue: 76 / 255, alpha: 1.0)
            case .ice:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 150 / 255,
                    green: 210 / 255,
                    blue: 210 / 255,
                    alpha: 1.0
                ) : UIColor(red: 150 / 255, green: 217 / 255, blue: 214 / 255, alpha: 1.0)
            case .fighting:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 194 / 255,
                    green: 46 / 255,
                    blue: 40 / 255,
                    alpha: 1.0
                ) : UIColor(red: 194 / 255, green: 46 / 255, blue: 40 / 255, alpha: 1.0)
            case .poison:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 163 / 255,
                    green: 62 / 255,
                    blue: 161 / 255,
                    alpha: 1.0
                ) : UIColor(red: 163 / 255, green: 62 / 255, blue: 161 / 255, alpha: 1.0)
            case .ground:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 194 / 255,
                    green: 143 / 255,
                    blue: 81 / 255,
                    alpha: 1.0
                ) : UIColor(red: 226 / 255, green: 191 / 255, blue: 101 / 255, alpha: 1.0)
            case .flying:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 169 / 255,
                    green: 143 / 255,
                    blue: 243 / 255,
                    alpha: 1.0
                ) : UIColor(red: 169 / 255, green: 143 / 255, blue: 243 / 255, alpha: 1.0)
            case .psychic:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 249 / 255,
                    green: 85 / 255,
                    blue: 135 / 255,
                    alpha: 1.0
                ) : UIColor(red: 249 / 255, green: 85 / 255, blue: 135 / 255, alpha: 1.0)
            case .bug:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 166 / 255,
                    green: 185 / 255,
                    blue: 26 / 255,
                    alpha: 1.0
                ) : UIColor(red: 166 / 255, green: 185 / 255, blue: 26 / 255, alpha: 1.0)
            case .rock:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 182 / 255,
                    green: 161 / 255,
                    blue: 54 / 255,
                    alpha: 1.0
                ) : UIColor(red: 182 / 255, green: 161 / 255, blue: 54 / 255, alpha: 1.0)
            case .ghost:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 115 / 255,
                    green: 87 / 255,
                    blue: 151 / 255,
                    alpha: 1.0
                ) : UIColor(red: 115 / 255, green: 87 / 255, blue: 151 / 255, alpha: 1.0)
            case .dragon:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 111 / 255,
                    green: 53 / 255,
                    blue: 252 / 255,
                    alpha: 1.0
                ) : UIColor(red: 111 / 255, green: 53 / 255, blue: 252 / 255, alpha: 1.0)
            case .dark:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 112 / 255,
                    green: 88 / 255,
                    blue: 70 / 255,
                    alpha: 1.0
                ) : UIColor(red: 112 / 255, green: 88 / 255, blue: 70 / 255, alpha: 1.0)
            case .steel:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 183 / 255,
                    green: 183 / 255,
                    blue: 206 / 255,
                    alpha: 1.0
                ) : UIColor(red: 183 / 255, green: 183 / 255, blue: 206 / 255, alpha: 1.0)
            case .fairy:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 214 / 255,
                    green: 133 / 255,
                    blue: 173 / 255,
                    alpha: 1.0
                ) : UIColor(red: 214 / 255, green: 133 / 255, blue: 173 / 255, alpha: 1.0)
            case .stellar:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 184 / 255,
                    green: 104 / 255,
                    blue: 212 / 255,
                    alpha: 1.0
                ) : UIColor(red: 184 / 255, green: 104 / 255, blue: 212 / 255, alpha: 1.0)
            case .unknown:
                return traitCollection.userInterfaceStyle == .dark ? UIColor(
                    red: 104 / 255,
                    green: 160 / 255,
                    blue: 144 / 255,
                    alpha: 1.0
                ) : UIColor(red: 104 / 255, green: 160 / 255, blue: 144 / 255, alpha: 1.0)
            }
        })
    }
}
