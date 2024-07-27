import Foundation

// Domain model for Location
public struct Location: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: LocationName
    public let region: RegionName
    public let names: [Name]
    public let gameIndices: [GenerationGameIndex]
    public let areas: [LocationAreaName]

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }

    public struct GenerationGameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let generation: GenerationName
    }
}

// Domain model for LocationArea
public struct LocationArea: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: LocationAreaName
    public let gameIndex: Int
    public let encounterMethodRates: [EncounterMethodRate]
    public let location: LocationName
    public let names: [Name]
    public let pokemonEncounters: [PokemonEncounter]

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }

    public struct EncounterMethodRate: Codable, Hashable {
        public let encounterMethod: EncounterMethodName
        public let versionDetails: [VersionDetail]

        public struct VersionDetail: Codable, Hashable {
            public let rate: Int
            public let version: VersionName
        }
    }

    public struct PokemonEncounter: Codable, Hashable {
        public let pokemon: PokemonName
        public let versionDetails: [VersionDetail]

        public struct VersionDetail: Codable, Hashable {
            public let version: VersionName
            public let maxChance: Int
            public let encounterDetails: [EncounterDetail]

            public struct EncounterDetail: Codable, Hashable {
                public let minLevel: Int
                public let maxLevel: Int
                public let conditionValues: [EncounterConditionValueName]
                public let chance: Int
                public let method: EncounterMethodName
            }
        }
    }
}

// Domain model for PalParkArea
public struct PalParkArea: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: PalParkAreaName
    public let names: [Name]
    public let pokemonEncounters: [EncounterSpecies]

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }

    public struct EncounterSpecies: Codable, Hashable {
        public let baseScore: Int
        public let rate: Int
        public let pokemonSpecies: PokemonSpeciesName
    }
}

// Domain model for Region
public struct Region: Codable, Hashable, Identifiable {
    public let id: Int
    public let name: RegionName
    public let locations: [LocationName]
    public let mainGeneration: GenerationName
    public let names: [Name]
    public let pokedexes: [PokedexName]
    public let versionGroups: [VersionGroupName]

    public struct Name: Codable, Hashable {
        public let name: String
        public let language: LanguageName
    }
}

extension Location {
    init(apiModel: LocationResponse) {
        id = apiModel.id
        name = apiModel.name
        region = RegionName(rawValue: apiModel.region.name)
        names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        gameIndices = apiModel.game_indices.map {
            GenerationGameIndex(gameIndex: $0.game_index, generation: GenerationName(rawValue: $0.generation.name))
        }
        areas = apiModel.areas.map {
            LocationAreaName(rawValue: $0.name)
        }
    }
}

extension LocationArea {
    init(apiModel: LocationAreaResponse) {
        id = apiModel.id
        name = apiModel.name
        gameIndex = apiModel.game_index
        encounterMethodRates = apiModel.encounter_method_rates.map {
            EncounterMethodRate(
                encounterMethod: EncounterMethodName(rawValue: $0.encounter_method.name),
                versionDetails: $0.version_details.map {
                    EncounterMethodRate.VersionDetail(rate: $0.rate, version: VersionName(rawValue: $0.version.name))
                }
            )
        }
        location = LocationName(rawValue: apiModel.location.name)
        names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        pokemonEncounters = apiModel.pokemon_encounters.map {
            PokemonEncounter(
                pokemon: PokemonName(rawValue: $0.pokemon.name),
                versionDetails: $0.version_details.map {
                    PokemonEncounter.VersionDetail(
                        version: VersionName(rawValue: $0.version.name),
                        maxChance: $0.max_chance,
                        encounterDetails: $0.encounter_details.map {
                            PokemonEncounter.VersionDetail.EncounterDetail(
                                minLevel: $0.min_level,
                                maxLevel: $0.max_level,
                                conditionValues: $0.condition_values.map {
                                    EncounterConditionValueName(rawValue: $0.name)
                                },
                                chance: $0.chance,
                                method: EncounterMethodName(rawValue: $0.method.name)
                            )
                        }
                    )
                }
            )
        }
    }
}

extension PalParkArea {
    init(apiModel: PalParkAreaResponse) {
        id = apiModel.id
        name = apiModel.name
        names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        pokemonEncounters = apiModel.pokemon_encounters.map {
            EncounterSpecies(
                baseScore: $0.base_score,
                rate: $0.rate,
                pokemonSpecies: PokemonSpeciesName(rawValue: $0.pokemon_species.name)
            )
        }
    }
}

extension Region {
    init(apiModel: RegionResponse) {
        id = apiModel.id
        name = apiModel.name
        locations = apiModel.locations.map {
            LocationName(rawValue: $0.name)
        }
        mainGeneration = GenerationName(rawValue: apiModel.main_generation.name)
        names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        pokedexes = apiModel.pokedexes.map {
            PokedexName(rawValue: $0.name)
        }
        versionGroups = apiModel.version_groups.map {
            VersionGroupName(rawValue: $0.name)
        }
    }
}
