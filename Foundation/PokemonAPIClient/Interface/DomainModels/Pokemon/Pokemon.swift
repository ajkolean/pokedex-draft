import Foundation
import MemberwiseInit

// Domain model for Ability
@MemberwiseInit(.public)
public struct Ability: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: AbilityName
    public let isMainSeries: Bool
    public let generation: GenerationName
    public let names: [Name]
    public let effectEntries: [VerboseEffect]
    public let effectChanges: [EffectChange]
    public let flavorTextEntries: [FlavorText]
    public let pokemon: [AbilityPokemon]

    @MemberwiseInit(.public)
    public struct VerboseEffect: Codable, Hashable {
        public let effect: String
        public let shortEffect: String
        public let language: LanguageName
    }

    @MemberwiseInit(.public)
    public struct EffectChange: Codable, Hashable {
        public let versionGroup: VersionGroupName
        public let effectEntries: [VerboseEffect]
    }

    @MemberwiseInit(.public)
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
        public let versionGroup: VersionGroupName
    }

    @MemberwiseInit(.public)
    public struct AbilityPokemon: Codable, Hashable {
        public let isHidden: Bool
        public let slot: Int
        public let pokemon: PokemonName
    }
}

// Domain model for Characteristic
@MemberwiseInit(.public)
public struct Characteristic: Codable, Hashable, Identifiable {
    public let id: CharacteristicID
    public let geneModulo: Int
    public let possibleValues: [Int]
    public let highestStat: StatName
    public let descriptions: [Description]
}

// Domain model for EggGroup
@MemberwiseInit(.public)
public struct EggGroup: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: EggGroupName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
}

// Domain model for Gender
@MemberwiseInit(.public)
public struct Gender: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: GenderName
    public let pokemonSpeciesDetails: [PokemonSpeciesGender]
    public let requiredForEvolution: [PokemonSpeciesName]

    @MemberwiseInit(.public)
    public struct PokemonSpeciesGender: Codable, Hashable {
        public let rate: Int
        public let pokemonSpecies: PokemonSpeciesName
    }
}

// Domain model for GrowthRate
@MemberwiseInit(.public)
public struct GrowthRate: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: GrowthRateName
    public let formula: String
    public let descriptions: [Description]
    public let levels: [ExperienceLevel]
    public let pokemonSpecies: [PokemonSpeciesName]

    @MemberwiseInit(.public)
    public struct ExperienceLevel: Codable, Hashable {
        public let level: Int
        public let experience: Int
    }
}

// Domain model for Nature
@MemberwiseInit(.public)
public struct Nature: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: NatureName
    public let decreasedStat: StatName
    public let increasedStat: StatName
    public let hatesFlavor: BerryFlavorName
    public let likesFlavor: BerryFlavorName
    public let pokeathlonStatChanges: [StatChange]
    public let moveBattleStylePreferences: [MoveBattleStylePreference]
    public let names: [Name]

    @MemberwiseInit(.public)
    public struct StatChange: Codable, Hashable {
        public let maxChange: Int
        public let pokeathlonStat: PokeathlonStatName
    }

    @MemberwiseInit(.public)
    public struct MoveBattleStylePreference: Codable, Hashable {
        public let lowHPPreference: Int
        public let highHPPreference: Int
        public let moveBattleStyle: MoveBattleStyleName
    }
}

// Domain model for PokeathlonStat
@MemberwiseInit(.public)
public struct PokeathlonStat: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokeathlonStatName
    public let names: [Name]
    public let affectingNatures: AffectingNatures

    @MemberwiseInit(.public)
    public struct AffectingNatures: Codable, Hashable {
        public let increase: [NatureStatChange]
        public let decrease: [NatureStatChange]

        @MemberwiseInit(.public)
        public struct NatureStatChange: Codable, Hashable {
            public let maxChange: Int
            public let nature: NatureName
        }
    }
}

// Domain model for Pokemon
@MemberwiseInit(.public)
public struct Pokemon: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonName
    public let baseExperience: Int
    public let height: Int
    public let isDefault: Bool
    public let order: Int
    public let weight: Int
    public let abilities: [Ability]
    public let forms: [PokemonFormName]
    public let gameIndices: [GameIndex]
    public let heldItems: [HeldItem]
    public let locationAreaEncounters: String
    public let moves: [Move]
    public let pastTypes: [PastType]
    public let sprites: Sprites
    public let cries: Cries
    public let species: PokemonSpeciesName
    public let stats: [Stat]
    public let types: [TypeSlot]

    @MemberwiseInit(.public)
    public struct Ability: Codable, Hashable {
        public let isHidden: Bool
        public let slot: Int
        public let ability: AbilityName
    }

    @MemberwiseInit(.public)
    public struct GameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let version: VersionName
    }

    @MemberwiseInit(.public)
    public struct HeldItem: Codable, Hashable {
        public let item: ItemName
        public let versionDetails: [VersionDetail]

        @MemberwiseInit(.public)
        public struct VersionDetail: Codable, Hashable {
            public let version: VersionName
            public let rarity: Int
        }
    }

    @MemberwiseInit(.public)
    public struct Move: Codable, Hashable {
        public let move: MoveName
        public let versionGroupDetails: [VersionGroupDetail]

        @MemberwiseInit(.public)
        public struct VersionGroupDetail: Codable, Hashable {
            public let moveLearnMethod: MoveLearnMethodName
            public let versionGroup: VersionGroupName
            public let levelLearnedAt: Int
        }
    }

    @MemberwiseInit(.public)
    public struct PastType: Codable, Hashable {
        public let generation: GenerationName
        public let types: [TypeSlot]
    }

    @MemberwiseInit(.public)
    public struct Sprites: Codable, Hashable {
        public let backDefault: String?
        public let backFemale: String?
        public let backShiny: String?
        public let backShinyFemale: String?
        public let frontDefault: String?
        public let frontFemale: String?
        public let frontShiny: String?
        public let frontShinyFemale: String?
    }

    @MemberwiseInit(.public)
    public struct Cries: Codable, Hashable {
        public let latest: String
        public let legacy: String
    }

    @MemberwiseInit(.public)
    public struct Stat: Codable, Hashable {
        public let baseStat: Int
        public let effort: Int
        public let stat: StatName
    }

    @MemberwiseInit(.public)
    public struct TypeSlot: Codable, Hashable {
        public let slot: Int
        public let type: TypeName
    }
}

// Domain model for PokemonColor
@MemberwiseInit(.public)
public struct PokemonColor: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonColorName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
}

// Domain model for PokemonForm
@MemberwiseInit(.public)
public struct PokemonForm: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonFormName
    public let order: Int
    public let formOrder: Int
    public let isDefault: Bool
    public let isBattleOnly: Bool
    public let isMega: Bool
    public let formName: String
    public let pokemon: PokemonName
    public let types: [TypeSlot]
    public let sprites: Sprites
    public let versionGroup: VersionGroupName
    public let names: [Name]
    public let formNames: [Name]

    @MemberwiseInit(.public)
    public struct TypeSlot: Codable, Hashable {
        public let slot: Int
        public let type: TypeName
    }
}

// Domain model for PokemonHabitat
@MemberwiseInit(.public)
public struct PokemonHabitat: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonHabitatName
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]
}

// Domain model for PokemonShape
@MemberwiseInit(.public)
public struct PokemonShape: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonShapeName
    public let awesomeNames: [AwesomeName]
    public let names: [Name]
    public let pokemonSpecies: [PokemonSpeciesName]

    @MemberwiseInit(.public)
    public struct AwesomeName: Codable, Hashable {
        public let awesomeName: String
        public let language: LanguageName
    }
}

// Domain model for PokemonSpecies
@MemberwiseInit(.public)
public struct PokemonSpecies: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PokemonSpeciesName
    public let order: Int
    public let genderRate: Int
    public let captureRate: Int
    public let baseHappiness: Int
    public let isBaby: Bool
    public let isLegendary: Bool
    public let isMythical: Bool
    public let hatchCounter: Int
    public let hasGenderDifferences: Bool
    public let formsSwitchable: Bool
    public let growthRate: GrowthRateName
    public let pokedexNumbers: [PokedexNumber]
    public let eggGroups: [EggGroupName]
    public let color: PokemonColorName
    public let shape: PokemonShapeName
    public let evolvesFromSpecies: PokemonSpeciesName?
    public let evolutionChain: URL
    public let habitat: PokemonHabitatName?
    public let generation: GenerationName
    public let names: [Name]
    public let palParkEncounters: [PalParkEncounter]
    public let flavorTextEntries: [FlavorText]
    public let formDescriptions: [Description]
    public let genera: [Genus]
    public let varieties: [Variety]

    @MemberwiseInit(.public)
    public struct PokedexNumber: Codable, Hashable {
        public let entryNumber: Int
        public let pokedex: PokedexName
    }

    @MemberwiseInit(.public)
    public struct PalParkEncounter: Codable, Hashable {
        public let baseScore: Int
        public let rate: Int
        public let area: PalParkAreaName
    }

    @MemberwiseInit(.public)
    public struct FlavorText: Codable, Hashable {
        public let flavorText: String
        public let language: LanguageName
        public let version: VersionName
    }

    @MemberwiseInit(.public)
    public struct Genus: Codable, Hashable {
        public let genus: String
        public let language: LanguageName
    }

    @MemberwiseInit(.public)
    public struct Variety: Codable, Hashable {
        public let isDefault: Bool
        public let pokemon: PokemonName
    }
}

// Domain model for Stat
@MemberwiseInit(.public)
public struct Stat: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: StatName
    public let gameIndex: Int
    public let isBattleOnly: Bool
    public let affectingMoves: AffectingMoves
    public let affectingNatures: AffectingNatures
    public let characteristics: [URL]
    public let moveDamageClass: MoveDamageClassName
    public let names: [Name]

    @MemberwiseInit(.public)
    public struct AffectingMoves: Codable, Hashable {
        public let increase: [MoveStatChange]
        public let decrease: [MoveStatChange]

        @MemberwiseInit(.public)
        public struct MoveStatChange: Codable, Hashable {
            public let change: Int
            public let move: MoveName
        }
    }

    @MemberwiseInit(.public)
    public struct AffectingNatures: Codable, Hashable {
        public let increase: [NatureName]
        public let decrease: [NatureName]
    }
}

// Domain model for Type
@MemberwiseInit(.public)
public struct PokemonType: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: TypeName
    public let damageRelations: DamageRelations
    public let pastDamageRelations: [PastDamageRelations]
    public let gameIndices: [GameIndex]
    public let generation: GenerationName
    public let moveDamageClass: MoveDamageClassName
    public let names: [Name]
    public let pokemon: [TypePokemon]
    public let moves: [MoveName]

    @MemberwiseInit(.public)
    public struct DamageRelations: Codable, Hashable {
        public let noDamageTo: [TypeName]
        public let halfDamageTo: [TypeName]
        public let doubleDamageTo: [TypeName]
        public let noDamageFrom: [TypeName]
        public let halfDamageFrom: [TypeName]
        public let doubleDamageFrom: [TypeName]
    }

    @MemberwiseInit(.public)
    public struct PastDamageRelations: Codable, Hashable {
        public let generation: GenerationName
        public let damageRelations: DamageRelations
    }

    @MemberwiseInit(.public)
    public struct GameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let generation: GenerationName
    }

    @MemberwiseInit(.public)
    public struct TypePokemon: Codable, Hashable {
        public let slot: Int
        public let pokemon: PokemonName
    }
}

@MemberwiseInit(.public)
public struct Sprites: Codable, Hashable {
    public let backDefault: String?
    public let backFemale: String?
    public let backShiny: String?
    public let backShinyFemale: String?
    public let frontDefault: String?
    public let frontFemale: String?
    public let frontShiny: String?
    public let frontShinyFemale: String?
}
