import Foundation

extension Location {
    init(apiModel: LocationResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let region = RegionName(rawValue: apiModel.region.name)
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let gameIndices = apiModel.game_indices.map {
            GenerationGameIndex(gameIndex: $0.game_index, generation: GenerationName(rawValue: $0.generation.name))
        }
        let areas = apiModel.areas.map {
            LocationAreaName(rawValue: $0.name)
        }

        self.init(id: id, name: name, region: region, names: names, gameIndices: gameIndices, areas: areas)
    }
}

extension LocationArea {
    init(apiModel: LocationAreaResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let gameIndex = apiModel.game_index
        let encounterMethodRates = apiModel.encounter_method_rates.map {
            EncounterMethodRate(
                encounterMethod: EncounterMethodName(rawValue: $0.encounter_method.name),
                versionDetails: $0.version_details.map {
                    EncounterMethodRate.VersionDetail(rate: $0.rate, version: VersionName(rawValue: $0.version.name))
                }
            )
        }
        let location = LocationName(rawValue: apiModel.location.name)
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let pokemonEncounters = apiModel.pokemon_encounters.map {
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

        self.init(
            id: id,
            name: name,
            gameIndex: gameIndex,
            encounterMethodRates: encounterMethodRates,
            location: location,
            names: names,
            pokemonEncounters: pokemonEncounters
        )
    }
}

extension PalParkArea {
    init(apiModel: PalParkAreaResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let pokemonEncounters = apiModel.pokemon_encounters.map {
            EncounterSpecies(
                baseScore: $0.base_score,
                rate: $0.rate,
                pokemonSpecies: PokemonSpeciesName(rawValue: $0.pokemon_species.name)
            )
        }

        self.init(id: id, name: name, names: names, pokemonEncounters: pokemonEncounters)
    }
}

extension Region {
    init(apiModel: RegionResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let locations = apiModel.locations.map {
            LocationName(rawValue: $0.name)
        }
        let mainGeneration = GenerationName(rawValue: apiModel.main_generation.name)
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let pokedexes = apiModel.pokedexes.map {
            PokedexName(rawValue: $0.name)
        }
        let versionGroups = apiModel.version_groups.map {
            VersionGroupName(rawValue: $0.name)
        }

        self.init(
            id: id,
            name: name,
            locations: locations,
            mainGeneration: mainGeneration,
            names: names,
            pokedexes: pokedexes,
            versionGroups: versionGroups
        )
    }
}
