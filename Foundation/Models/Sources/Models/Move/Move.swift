import Foundation
import MemberwiseInit

public struct Move: Hashable, Codable, Identifiable, Sendable {
    public typealias Name = Identifier<String>
    public typealias ID = Identifier<Int>

    public enum DamageClass: String, Hashable, Codable, Sendable {
        case status
        case physical
        case special
    }

    public struct Summary: Hashable, Codable, Identifiable, Sendable {
        public var id: Move.ID {
            @storageRestrictions(initializes: _id)
            init(initialValue) { _id = initialValue.rawValue }
            get { Move.ID(rawValue: _id) }
        }

        public var name: Move.Name {
            @storageRestrictions(initializes: _name)
            init(initialValue) { _name = initialValue.rawValue }
            get { Move.Name(rawValue: _name) }
        }

        private let _id: Int
        private let _name: String
        public let accuracy: Int?
        public let power: Int?
        public let pp: Int?
        public let priority: Int?
        public let type: PokemonTypeEnum

        public init(
            id: Move.ID,
            name: Move.Name,
            accuracy: Int?,
            power: Int?,
            pp: Int?,
            priority: Int?,
            type: PokemonTypeEnum
        ) {
            self.id = id
            self.name = name
            self.accuracy = accuracy
            self.power = power
            self.pp = pp
            self.priority = priority
            self.type = type
        }
    }

    public var id: ID { summary.id }
    public let summary: Summary
    public let damageClass: DamageClass
    public let generation: Generation
    public let pokemon: [PokemonSummary]
    public let descriptions: [String]
    public let moveEffectChance: Int?
    public let moveEffectTexts: [String]

    public init(
        summary: Summary,
        damageClass: DamageClass,
        generation: Generation,
        pokemon: [PokemonSummary],
        descriptions: [String],
        moveEffectChance: Int?,
        moveEffectTexts: [String]
    ) {
        self.summary = summary
        self.damageClass = damageClass
        self.generation = generation
        self.pokemon = pokemon
        self.descriptions = descriptions
        self.moveEffectChance = moveEffectChance
        self.moveEffectTexts = moveEffectTexts
    }
}

extension Move.Summary {
    public static var maxPP = 35 // max 40, min 5
    public static var maxAccurancy = 100
    public static var maxPower = 250
    public static var maxPriority = 13 // (-5, 7)

    public var accuracyString: String {
        accuracy.map { "\($0)" } ?? "???"
    }

    public var ppString: String {
        pp.map { "\($0)" } ?? "???"
    }

    public var powerString: String {
        power.map { "\($0)" } ?? "???"
    }

    public var priorityString: String {
        priority.map { "\($0)" } ?? "???"
    }
}

extension Move {
    public var longDescription: String? {
        descriptions.longestString()
    }

    public var moveEffectTextFormatted: String? {
        guard let text = moveEffectTexts.longestString() else { return nil }
        guard let moveEffectChance else { return text }
        return text.replacingOccurrences(of: "$effect_chance", with: "\(moveEffectChance)")
    }
}

import SwiftUI

extension Move.DamageClass {
    public var color: Color {
        switch self {
        case .status:
            .mint
        case .physical:
            .orange
        case .special:
            .purple
        }
    }

    public var icon: Image {
        switch self {
        case .status:
            Image(systemName: "bolt.horizontal.circle")
        case .physical:
            Image(systemName: "hands.clap.fill")
        case .special:
            Image(systemName: "sparkle")
        }
    }
}
