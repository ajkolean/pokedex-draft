// Foundation/Models/Sources/Models/PokemonDetails.swift
import Foundation
import SwiftUI

public struct PokemonAbility: Codable, Hashable {
    public struct Ability: Codable, Hashable {
        public let name: String
        public let url: URL
    }

    public let ability: Ability
    public let isHidden: Bool
    public let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

public struct PokemonCry: Codable, Hashable {
    public let latest: URL
    public let legacy: URL?
}

public struct PokemonForm: Codable, Hashable {
    public let name: String
    public let url: URL
}

public struct GameIndex: Codable, Hashable {
    public struct Version: Codable, Hashable {
        public let name: String
        public let url: URL
    }

    public let gameIndex: Int
    public let version: Version

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

public struct Move: Codable, Hashable {
    public struct MoveDetail: Codable, Hashable {
        public let name: String
        public let url: URL
    }

    public struct VersionGroupDetail: Codable, Hashable {
        public struct MoveLearnMethod: Codable, Hashable {
            public let name: String
            public let url: URL
        }

        public struct VersionGroup: Codable, Hashable {
            public let name: String
            public let url: URL
        }

        public let levelLearnedAt: Int
        public let moveLearnMethod: MoveLearnMethod
        public let versionGroup: VersionGroup

        enum CodingKeys: String, CodingKey {
            case levelLearnedAt = "level_learned_at"
            case moveLearnMethod = "move_learn_method"
            case versionGroup = "version_group"
        }
    }

    public let move: MoveDetail
    public let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

public struct PokemonSprite: Codable, Hashable {
    public struct Other: Codable, Hashable {
        public struct DreamWorld: Codable, Hashable {
            public let frontDefault: URL?
            public let frontFemale: URL?

            enum CodingKeys: String, CodingKey {
                case frontDefault = "front_default"
                case frontFemale = "front_female"
            }
        }

        public struct Home: Codable, Hashable {
            public let frontDefault: URL?
            public let frontFemale: URL?
            public let frontShiny: URL?
            public let frontShinyFemale: URL?

            enum CodingKeys: String, CodingKey {
                case frontDefault = "front_default"
                case frontFemale = "front_female"
                case frontShiny = "front_shiny"
                case frontShinyFemale = "front_shiny_female"
            }
        }

        public struct OfficialArtwork: Codable, Hashable {
            public let frontDefault: URL
            public let frontShiny: URL

            enum CodingKeys: String, CodingKey {
                case frontDefault = "front_default"
                case frontShiny = "front_shiny"
            }
        }

        public struct Showdown: Codable, Hashable {
            public let backDefault: URL?
            public let backFemale: URL?
            public let backShiny: URL?
            public let backShinyFemale: URL?
            public let frontDefault: URL?
            public let frontFemale: URL?
            public let frontShiny: URL?
            public let frontShinyFemale: URL?

            enum CodingKeys: String, CodingKey {
                case backDefault = "back_default"
                case backFemale = "back_female"
                case backShiny = "back_shiny"
                case backShinyFemale = "back_shiny_female"
                case frontDefault = "front_default"
                case frontFemale = "front_female"
                case frontShiny = "front_shiny"
                case frontShinyFemale = "front_shiny_female"
            }
        }

        public let dreamWorld: DreamWorld
        public let home: Home
        public let officialArtwork: OfficialArtwork
        public let showdown: Showdown

        enum CodingKeys: String, CodingKey {
            case dreamWorld = "dream_world"
            case home
            case officialArtwork = "official-artwork"
            case showdown
        }
    }

    public let backDefault: URL?
    public let backFemale: URL?
    public let backShiny: URL?
    public let backShinyFemale: URL?
    public let frontDefault: URL?
    public let frontFemale: URL?
    public let frontShiny: URL?
    public let frontShinyFemale: URL?
    public let other: Other

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
    }
}

public struct Stat: Codable, Hashable {
    public struct StatDetail: Codable, Hashable {
        public let name: String
        public let url: URL
    }

    public let baseStat: Int
    public let effort: Int
    public let stat: StatDetail

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

public struct PokemonDetails: Codable, Hashable, Identifiable {
    public let abilities: [PokemonAbility]
    public let baseExperience: Int
    public let cries: PokemonCry
    public let forms: [PokemonForm]
    public let height: Int
    public let id: Int
    public let isDefault: Bool
    public let locationAreaEncounters: URL
    public let moves: [Move]
    public let name: PokemonName
    public let order: Int
    public let species: PokemonForm
    public let stats: [Stat]
    public let types: [PokemonType]
    public let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries
        case forms
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
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

    public var primaryType: PokemonType? {
        types.first(where: { $0.slot == 1 }) ?? types.first
    }

    public var backgroundColor: Color {
        primaryType?.type.backgroundColor ?? .gray
    }
}
