// Foundation/Models/Sources/Models/PokemonDetails.swift
import Foundation
import SwiftUI

public struct PokemonAbility: Codable, Hashable, Sendable  {
    public struct Ability: Codable, Hashable, Sendable  {
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

public struct PokemonCry: Codable, Hashable, Sendable  {
    public let latest: URL
    public let legacy: URL?
}

public struct PokemonForm: Codable, Hashable, Sendable  {
    public let name: String
    public let url: URL
}

public struct GameIndex: Codable, Hashable, Sendable  {
    public struct Version: Codable, Hashable, Sendable  {
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

public struct Move: Codable, Hashable, Sendable  {
    public struct MoveDetail: Codable, Hashable, Sendable  {
        public let name: String
        public let url: URL
    }
    
    public struct VersionGroupDetail: Codable, Hashable, Sendable  {
        public struct MoveLearnMethod: Codable, Hashable, Sendable  {
            public let name: String
            public let url: URL
        }
        
        public struct VersionGroup: Codable, Hashable, Sendable  {
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

public struct Stat: Codable, Hashable, Sendable  {
    public struct StatDetail: Codable, Hashable, Sendable  {
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
