import Foundation
import PokemonAPIClientInterface

extension Name {
    init(apiModel: NameResponse) {
        let name = apiModel.name
        let language = LanguageName(rawValue: apiModel.language.name)
        self.init(name: name, language: language)
    }
}

extension Description {
    init(apiModel: DescriptionResponse) {
        let description = apiModel.description
        let language = LanguageName(rawValue: apiModel.language.name)
        self.init(description: description, language: language)
    }
}


// Helper extension to map NameResponse to Name
extension Array where Element == NameResponse {
    func toNames() -> [Name] {
        return self.map { Name(apiModel: $0) }
    }
}

// Helper extension to map DescriptionResponse to Description
extension Array where Element == DescriptionResponse {
    func toDescriptions() -> [Description] {
        return self.map { Description(apiModel: $0) }
    }
}

// Helper extension to map VerboseEffectResponse to Ability.VerboseEffect
extension Array where Element == VerboseEffectResponse {
    func toVerboseEffects() -> [Ability.VerboseEffect] {
        return self.map { Ability.VerboseEffect(effect: $0.effect, shortEffect: $0.short_effect, language: LanguageName(rawValue: $0.language.name)) }
    }
}

// Helper extension to map AbilityEffectChangeResponse to Ability.EffectChange
extension Array where Element == AbilityEffectChangeResponse {
    func toEffectChanges() -> [Ability.EffectChange] {
        return self.map { Ability.EffectChange(
            versionGroup: VersionGroupName(rawValue: $0.version_group.name),
            effectEntries: $0.effect_entries.toVerboseEffects()
        ) }
    }
}

// Helper extension to map AbilityFlavorTextResponse to Ability.FlavorText
extension Array where Element == AbilityFlavorTextResponse {
    func toFlavorTextEntries() -> [Ability.FlavorText] {
        return self.map { Ability.FlavorText(flavorText: $0.flavor_text, language: LanguageName(rawValue: $0.language.name), versionGroup: VersionGroupName(rawValue: $0.version_group.name)) }
    }
}

// Helper extension to map AbilityPokemonResponse to Ability.AbilityPokemon
extension Array where Element == AbilityPokemonResponse {
    func toAbilityPokemon() -> [Ability.AbilityPokemon] {
        return self.map { Ability.AbilityPokemon(isHidden: $0.is_hidden, slot: $0.slot, pokemon: PokemonName(rawValue: $0.pokemon.name)) }
    }
}

