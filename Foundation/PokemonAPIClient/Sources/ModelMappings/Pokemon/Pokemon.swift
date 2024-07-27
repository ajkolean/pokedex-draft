import Foundation
import PokemonAPIClientInterface

extension Ability {
    init(apiModel: AbilityResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let isMainSeries = apiModel.is_main_series
        let generation = GenerationName(rawValue: apiModel.generation.name)
        let names = apiModel.names.toNames()
        let effectEntries = apiModel.effect_entries.toVerboseEffects()
        let effectChanges = apiModel.effect_changes.toEffectChanges()
        let flavorTextEntries = apiModel.flavor_text_entries.toFlavorTextEntries()
        let pokemon = apiModel.pokemon.toAbilityPokemon()

        self.init(
            id: id,
            name: name,
            isMainSeries: isMainSeries,
            generation: generation,
            names: names,
            effectEntries: effectEntries,
            effectChanges: effectChanges,
            flavorTextEntries: flavorTextEntries,
            pokemon: pokemon
        )
    }
}

extension Characteristic {
    init(apiModel: CharacteristicResponse) {
        let id = apiModel.id
        let geneModulo = apiModel.gene_modulo
        let possibleValues = apiModel.possible_values
        let highestStat = StatName(rawValue: apiModel.highest_stat.name)
        let descriptions = apiModel.descriptions.toDescriptions()

        self.init(
            id: id,
            geneModulo: geneModulo,
            possibleValues: possibleValues,
            highestStat: highestStat,
            descriptions: descriptions
        )
    }
}

extension EggGroup {
    init(apiModel: EggGroupResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.toNames()
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            names: names,
            pokemonSpecies: pokemonSpecies
        )
    }
}

extension Gender {
    init(apiModel: GenderResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let pokemonSpeciesDetails = apiModel.pokemon_species_details.map { Gender.PokemonSpeciesGender(
            rate: $0.rate,
            pokemonSpecies: PokemonSpeciesName(rawValue: $0.pokemon_species.name)
        ) }
        let requiredForEvolution = apiModel.required_for_evolution.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            pokemonSpeciesDetails: pokemonSpeciesDetails,
            requiredForEvolution: requiredForEvolution
        )
    }
}

extension GrowthRate {
    init(apiModel: GrowthRateResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let formula = apiModel.formula
        let descriptions = apiModel.descriptions.toDescriptions()
        let levels = apiModel.levels.map { GrowthRate.ExperienceLevel(level: $0.level, experience: $0.experience) }
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            formula: formula,
            descriptions: descriptions,
            levels: levels,
            pokemonSpecies: pokemonSpecies
        )
    }
}

extension Nature {
    init(apiModel: NatureResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let decreasedStat = StatName(rawValue: apiModel.decreased_stat.name)
        let increasedStat = StatName(rawValue: apiModel.increased_stat.name)
        let hatesFlavor = BerryFlavorName(rawValue: apiModel.hates_flavor.name)
        let likesFlavor = BerryFlavorName(rawValue: apiModel.likes_flavor.name)
        let pokeathlonStatChanges = apiModel.pokeathlon_stat_changes.map { Nature.StatChange(
            maxChange: $0.max_change,
            pokeathlonStat: PokeathlonStatName(rawValue: $0.pokeathlon_stat.name)
        ) }
        let moveBattleStylePreferences = apiModel.move_battle_style_preferences.map { Nature.MoveBattleStylePreference(
            lowHPPreference: $0.low_hp_preference,
            highHPPreference: $0.high_hp_preference,
            moveBattleStyle: MoveBattleStyleName(rawValue: $0.move_battle_style.name)
        ) }
        let names = apiModel.names.toNames()

        self.init(
            id: id,
            name: name,
            decreasedStat: decreasedStat,
            increasedStat: increasedStat,
            hatesFlavor: hatesFlavor,
            likesFlavor: likesFlavor,
            pokeathlonStatChanges: pokeathlonStatChanges,
            moveBattleStylePreferences: moveBattleStylePreferences,
            names: names
        )
    }
}

extension PokeathlonStat {
    init(apiModel: PokeathlonStatResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.toNames()
        let affectingNatures = PokeathlonStat.AffectingNatures(
            increase: apiModel.affecting_natures.increase.map { PokeathlonStat.AffectingNatures.NatureStatChange(
                maxChange: $0.max_change,
                nature: NatureName(rawValue: $0.nature.name)
            ) },
            decrease: apiModel.affecting_natures.decrease.map { PokeathlonStat.AffectingNatures.NatureStatChange(
                maxChange: $0.max_change,
                nature: NatureName(rawValue: $0.nature.name)
            ) }
        )

        self.init(
            id: id,
            name: name,
            names: names,
            affectingNatures: affectingNatures
        )
    }
}

extension Pokemon {
    init(apiModel: PokemonResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let baseExperience = apiModel.base_experience
        let height = apiModel.height
        let isDefault = apiModel.is_default
        let order = apiModel.order
        let weight = apiModel.weight
        let abilities = apiModel.abilities.map { Pokemon.Ability(
            isHidden: $0.is_hidden,
            slot: $0.slot,
            ability: AbilityName(rawValue: $0.ability.name)
        ) }
        let forms = apiModel.forms.map { PokemonFormName(rawValue: $0.name) }
        let gameIndices = apiModel.game_indices.map { Pokemon.GameIndex(
            gameIndex: $0.game_index,
            version: VersionName(rawValue: $0.version.name)
        ) }
        let heldItems = apiModel.held_items.map { Pokemon.HeldItem(
            item: ItemName(rawValue: $0.item.name),
            versionDetails: $0.version_details.map { Pokemon.HeldItem.VersionDetail(
                version: VersionName(rawValue: $0.version.name),
                rarity: $0.rarity
            ) }
        ) }
        let locationAreaEncounters = apiModel.location_area_encounters
        let moves = apiModel.moves.map { Pokemon.Move(
            move: MoveName(rawValue: $0.move.name),
            versionGroupDetails: $0.version_group_details.map { Pokemon.Move.VersionGroupDetail(
                moveLearnMethod: MoveLearnMethodName(rawValue: $0.move_learn_method.name),
                versionGroup: VersionGroupName(rawValue: $0.version_group.name),
                levelLearnedAt: $0.level_learned_at
            ) }
        ) }
        let pastTypes = apiModel.past_types.map { Pokemon.PastType(
            generation: GenerationName(rawValue: $0.generation.name),
            types: $0.types.map { Pokemon.TypeSlot(slot: $0.slot, type: TypeName(rawValue: $0.type.name)) }
        ) }
        let sprites = Pokemon.Sprites(
            backDefault: apiModel.sprites.back_default,
            backFemale: apiModel.sprites.back_female,
            backShiny: apiModel.sprites.back_shiny,
            backShinyFemale: apiModel.sprites.back_shiny_female,
            frontDefault: apiModel.sprites.front_default,
            frontFemale: apiModel.sprites.front_female,
            frontShiny: apiModel.sprites.front_shiny,
            frontShinyFemale: apiModel.sprites.front_shiny_female
        )
        let cries = Pokemon.Cries(latest: apiModel.cries.latest, legacy: apiModel.cries.legacy)
        let species = PokemonSpeciesName(rawValue: apiModel.species.name)
        let stats = apiModel.stats.map { Pokemon.Stat(
            baseStat: $0.base_stat,
            effort: $0.effort,
            stat: StatName(rawValue: $0.stat.name)
        ) }
        let types = apiModel.types.map { Pokemon.TypeSlot(slot: $0.slot, type: TypeName(rawValue: $0.type.name)) }

        self.init(
            id: id,
            name: name,
            baseExperience: baseExperience,
            height: height,
            isDefault: isDefault,
            order: order,
            weight: weight,
            abilities: abilities,
            forms: forms,
            gameIndices: gameIndices,
            heldItems: heldItems,
            locationAreaEncounters: locationAreaEncounters,
            moves: moves,
            pastTypes: pastTypes,
            sprites: sprites,
            cries: cries,
            species: species,
            stats: stats,
            types: types
        )
    }
}

extension PokemonColor {
    init(apiModel: PokemonColorResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.toNames()
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            names: names,
            pokemonSpecies: pokemonSpecies
        )
    }
}

extension PokemonForm {
    init(apiModel: PokemonFormResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let order = apiModel.order
        let formOrder = apiModel.form_order
        let isDefault = apiModel.is_default
        let isBattleOnly = apiModel.is_battle_only
        let isMega = apiModel.is_mega
        let formName = apiModel.form_name
        let pokemon = PokemonName(rawValue: apiModel.pokemon.name)
        let types = apiModel.types.map { PokemonForm.TypeSlot(slot: $0.slot, type: TypeName(rawValue: $0.type.name)) }
        let sprites = Sprites(
            backDefault: apiModel.sprites.back_default,
            backFemale: apiModel.sprites.back_female,
            backShiny: apiModel.sprites.back_shiny,
            backShinyFemale: apiModel.sprites.back_shiny_female,
            frontDefault: apiModel.sprites.front_default,
            frontFemale: apiModel.sprites.front_female,
            frontShiny: apiModel.sprites.front_shiny,
            frontShinyFemale: apiModel.sprites.front_shiny_female
        )
        let versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        let names = apiModel.names.toNames()
        let formNames = apiModel.form_names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }

        self.init(
            id: id,
            name: name,
            order: order,
            formOrder: formOrder,
            isDefault: isDefault,
            isBattleOnly: isBattleOnly,
            isMega: isMega,
            formName: formName,
            pokemon: pokemon,
            types: types,
            sprites: sprites,
            versionGroup: versionGroup,
            names: names,
            formNames: formNames
        )
    }
}

extension PokemonHabitat {
    init(apiModel: PokemonHabitatResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.toNames()
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            names: names,
            pokemonSpecies: pokemonSpecies
        )
    }
}

extension PokemonShape {
    init(apiModel: PokemonShapeResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let awesomeNames = apiModel.awesome_names.map { PokemonShape.AwesomeName(
            awesomeName: $0.awesome_name,
            language: LanguageName(rawValue: $0.language.name)
        ) }
        let names = apiModel.names.toNames()
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            awesomeNames: awesomeNames,
            names: names,
            pokemonSpecies: pokemonSpecies
        )
    }
}

extension PokemonSpecies {
    init(apiModel: PokemonSpeciesResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let order = apiModel.order
        let genderRate = apiModel.gender_rate
        let captureRate = apiModel.capture_rate
        let baseHappiness = apiModel.base_happiness
        let isBaby = apiModel.is_baby
        let isLegendary = apiModel.is_legendary
        let isMythical = apiModel.is_mythical
        let hatchCounter = apiModel.hatch_counter
        let hasGenderDifferences = apiModel.has_gender_differences
        let formsSwitchable = apiModel.forms_switchable
        let growthRate = GrowthRateName(rawValue: apiModel.growth_rate.name)
        let pokedexNumbers = apiModel.pokedex_numbers.map { PokemonSpecies.PokedexNumber(
            entryNumber: $0.entry_number,
            pokedex: PokedexName(rawValue: $0.pokedex.name)
        ) }
        let eggGroups = apiModel.egg_groups.map { EggGroupName(rawValue: $0.name) }
        let color = PokemonColorName(rawValue: apiModel.color.name)
        let shape = PokemonShapeName(rawValue: apiModel.shape.name)
        let evolvesFromSpecies = apiModel.evolves_from_species.map { PokemonSpeciesName(rawValue: $0.name) }
        let evolutionChain = apiModel.evolution_chain.url
        let habitat = apiModel.habitat.map { PokemonHabitatName(rawValue: $0.name) }
        let generation = GenerationName(rawValue: apiModel.generation.name)
        let names = apiModel.names.toNames()
        let palParkEncounters = apiModel.pal_park_encounters.map { PokemonSpecies.PalParkEncounter(
            baseScore: $0.base_score,
            rate: $0.rate,
            area: PalParkAreaName(rawValue: $0.area.name)
        ) }
        let flavorTextEntries = apiModel.flavor_text_entries.map { PokemonSpecies.FlavorText(
            flavorText: $0.flavor_text,
            language: LanguageName(rawValue: $0.language.name),
            version: VersionName(rawValue: $0.version.name)
        ) }
        let formDescriptions = apiModel.form_descriptions.toDescriptions()
        let genera = apiModel.genera.map { PokemonSpecies.Genus(
            genus: $0.genus,
            language: LanguageName(rawValue: $0.language.name)
        ) }
        let varieties = apiModel.varieties.map { PokemonSpecies.Variety(
            isDefault: $0.is_default,
            pokemon: PokemonName(rawValue: $0.pokemon.name)
        ) }

        self.init(
            id: id,
            name: name,
            order: order,
            genderRate: genderRate,
            captureRate: captureRate,
            baseHappiness: baseHappiness,
            isBaby: isBaby,
            isLegendary: isLegendary,
            isMythical: isMythical,
            hatchCounter: hatchCounter,
            hasGenderDifferences: hasGenderDifferences,
            formsSwitchable: formsSwitchable,
            growthRate: growthRate,
            pokedexNumbers: pokedexNumbers,
            eggGroups: eggGroups,
            color: color,
            shape: shape,
            evolvesFromSpecies: evolvesFromSpecies,
            evolutionChain: evolutionChain,
            habitat: habitat,
            generation: generation,
            names: names,
            palParkEncounters: palParkEncounters,
            flavorTextEntries: flavorTextEntries,
            formDescriptions: formDescriptions,
            genera: genera,
            varieties: varieties
        )
    }
}

extension Stat {
    init(apiModel: StatResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let gameIndex = apiModel.game_index
        let isBattleOnly = apiModel.is_battle_only
        let affectingMoves = Stat.AffectingMoves(
            increase: apiModel.affecting_moves.increase.map { Stat.AffectingMoves.MoveStatChange(
                change: $0.change,
                move: MoveName(rawValue: $0.move.name)
            ) },
            decrease: apiModel.affecting_moves.decrease.map { Stat.AffectingMoves.MoveStatChange(
                change: $0.change,
                move: MoveName(rawValue: $0.move.name)
            ) }
        )
        let affectingNatures = Stat.AffectingNatures(
            increase: apiModel.affecting_natures.increase.map { NatureName(rawValue: $0.name) },
            decrease: apiModel.affecting_natures.decrease.map { NatureName(rawValue: $0.name) }
        )
        let characteristics = apiModel.characteristics.map(\.url)
        let moveDamageClass = MoveDamageClassName(rawValue: apiModel.move_damage_class.name)
        let names = apiModel.names.toNames()

        self.init(
            id: id,
            name: name,
            gameIndex: gameIndex,
            isBattleOnly: isBattleOnly,
            affectingMoves: affectingMoves,
            affectingNatures: affectingNatures,
            characteristics: characteristics,
            moveDamageClass: moveDamageClass,
            names: names
        )
    }
}

extension PokemonType {
    init(apiModel: TypeResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let damageRelations = PokemonType.DamageRelations(
            noDamageTo: apiModel.damage_relations.no_damage_to.map { TypeName(rawValue: $0.name) },
            halfDamageTo: apiModel.damage_relations.half_damage_to.map { TypeName(rawValue: $0.name) },
            doubleDamageTo: apiModel.damage_relations.double_damage_to.map { TypeName(rawValue: $0.name) },
            noDamageFrom: apiModel.damage_relations.no_damage_from.map { TypeName(rawValue: $0.name) },
            halfDamageFrom: apiModel.damage_relations.half_damage_from.map { TypeName(rawValue: $0.name) },
            doubleDamageFrom: apiModel.damage_relations.double_damage_from.map { TypeName(rawValue: $0.name) }
        )
        let pastDamageRelations = apiModel.past_damage_relations.map { PokemonType.PastDamageRelations(
            generation: GenerationName(rawValue: $0.generation.name),
            damageRelations: PokemonType.DamageRelations(
                noDamageTo: $0.damage_relations.no_damage_to.map { TypeName(rawValue: $0.name) },
                halfDamageTo: $0.damage_relations.half_damage_to.map { TypeName(rawValue: $0.name) },
                doubleDamageTo: $0.damage_relations.double_damage_to.map { TypeName(rawValue: $0.name) },
                noDamageFrom: $0.damage_relations.no_damage_from.map { TypeName(rawValue: $0.name) },
                halfDamageFrom: $0.damage_relations.half_damage_from.map { TypeName(rawValue: $0.name) },
                doubleDamageFrom: $0.damage_relations.double_damage_from.map { TypeName(rawValue: $0.name) }
            )
        ) }
        let gameIndices = apiModel.game_indices.map { PokemonType.GameIndex(
            gameIndex: $0.game_index,
            generation: GenerationName(rawValue: $0.generation.name)
        ) }
        let generation = GenerationName(rawValue: apiModel.generation.name)
        let moveDamageClass = MoveDamageClassName(rawValue: apiModel.move_damage_class.name)
        let names = apiModel.names.toNames()
        let pokemon = apiModel.pokemon.map { PokemonType.TypePokemon(
            slot: $0.slot,
            pokemon: PokemonName(rawValue: $0.pokemon.name)
        ) }
        let moves = apiModel.moves.map { MoveName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            damageRelations: damageRelations,
            pastDamageRelations: pastDamageRelations,
            gameIndices: gameIndices,
            generation: generation,
            moveDamageClass: moveDamageClass,
            names: names,
            pokemon: pokemon,
            moves: moves
        )
    }
}
