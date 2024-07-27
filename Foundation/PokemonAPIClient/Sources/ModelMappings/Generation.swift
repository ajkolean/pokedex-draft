import Foundation

extension Generation {
    init(apiModel: GenerationResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let abilities = apiModel.abilities.map { AbilityName(rawValue: $0.name) }
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        let mainRegion = RegionName(rawValue: apiModel.main_region.name)
        let moves = apiModel.moves.map { MoveName(rawValue: $0.name) }
        let pokemonSpecies = apiModel.pokemon_species.map { PokemonSpeciesName(rawValue: $0.name) }
        let types = apiModel.types.map { TypeName(rawValue: $0.name) }
        let versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            abilities: abilities,
            names: names,
            mainRegion: mainRegion,
            moves: moves,
            pokemonSpecies: pokemonSpecies,
            types: types,
            versionGroups: versionGroups
        )
    }
}

extension PokemonEntry {
    init(apiModel: PokemonEntryResponse) {
        let entryNumber = apiModel.entry_number
        let pokemonSpecies = PokemonSpeciesName(rawValue: apiModel.pokemon_species.name)

        self.init(entryNumber: entryNumber, pokemonSpecies: pokemonSpecies)
    }
}

extension Pokedex {
    init(apiModel: PokedexResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let isMainSeries = apiModel.is_main_series
        let descriptions = apiModel.descriptions.map { Description(
            description: $0.description,
            language: LanguageName(rawValue: $0.language.name)
        ) }
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        let pokemonEntries = apiModel.pokemon_entries.map { PokemonEntry(apiModel: $0) }
        let region = RegionName(rawValue: apiModel.region.name)
        let versionGroups = apiModel.version_groups.map { VersionGroupName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            isMainSeries: isMainSeries,
            descriptions: descriptions,
            names: names,
            pokemonEntries: pokemonEntries,
            region: region,
            versionGroups: versionGroups
        )
    }
}

extension Version {
    init(apiModel: VersionResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }
        let versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)

        self.init(id: id, name: name, names: names, versionGroup: versionGroup)
    }
}

extension VersionGroup {
    init(apiModel: VersionGroupResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let order = apiModel.order
        let generation = GenerationName(rawValue: apiModel.generation.name)
        let moveLearnMethods = apiModel.move_learn_methods.map { MoveLearnMethodName(rawValue: $0.name) }
        let pokedexes = apiModel.pokedexes.map { PokedexName(rawValue: $0.name) }
        let regions = apiModel.regions.map { RegionName(rawValue: $0.name) }
        let versions = apiModel.versions.map { VersionName(rawValue: $0.name) }

        self.init(
            id: id,
            name: name,
            order: order,
            generation: generation,
            moveLearnMethods: moveLearnMethods,
            pokedexes: pokedexes,
            regions: regions,
            versions: versions
        )
    }
}
