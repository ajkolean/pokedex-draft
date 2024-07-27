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
extension [NameResponse] {
    func toNames() -> [Name] {
        return map { Name(apiModel: $0) }
    }
}

// Helper extension to map DescriptionResponse to Description
extension [DescriptionResponse] {
    func toDescriptions() -> [Description] {
        return map { Description(apiModel: $0) }
    }
}

// Helper extension to map VerboseEffectResponse to Ability.VerboseEffect
extension [VerboseEffectResponse] {
    func toVerboseEffects() -> [Ability.VerboseEffect] {
        return map { Ability.VerboseEffect(
            effect: $0.effect,
            shortEffect: $0.short_effect,
            language: LanguageName(rawValue: $0.language.name)
        ) }
    }
}

// Helper extension to map AbilityEffectChangeResponse to Ability.EffectChange
extension [AbilityEffectChangeResponse] {
    func toEffectChanges() -> [Ability.EffectChange] {
        return map { Ability.EffectChange(
            versionGroup: VersionGroupName(rawValue: $0.version_group.name),
            effectEntries: $0.effect_entries.toVerboseEffects()
        ) }
    }
}

// Helper extension to map AbilityFlavorTextResponse to Ability.FlavorText
extension [AbilityFlavorTextResponse] {
    func toFlavorTextEntries() -> [Ability.FlavorText] {
        return map { Ability.FlavorText(
            flavorText: $0.flavor_text,
            language: LanguageName(rawValue: $0.language.name),
            versionGroup: VersionGroupName(rawValue: $0.version_group.name)
        ) }
    }
}

// Helper extension to map AbilityPokemonResponse to Ability.AbilityPokemon
extension [AbilityPokemonResponse] {
    func toAbilityPokemon() -> [Ability.AbilityPokemon] {
        return map {
            Ability.AbilityPokemon(isHidden: $0.is_hidden, slot: $0.slot, pokemon: PokemonName(rawValue: $0.pokemon.name))
        }
    }
}
