import Foundation

extension Item {
    init(apiModel: ItemResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let cost = apiModel.cost
        let flingPower = apiModel.fling_power
        let flingEffect = apiModel.fling_effect?.name
        let attributes = apiModel.attributes.map(\.name)
        let category = apiModel.category.name
        let effectEntries = apiModel.effect_entries.map {
            VerboseEffect(
                effect: $0.effect,
                shortEffect: $0.short_effect,
                language: LanguageName(rawValue: $0.language.name)
            )
        }
        let flavorTextEntries = apiModel.flavor_text_entries.map {
            FlavorText(
                text: $0.text,
                versionGroup: VersionGroupName(rawValue: $0.version_group.name),
                language: LanguageName(rawValue: $0.language.name)
            )
        }
        let gameIndices = apiModel.game_indices.map {
            GenerationGameIndex(
                gameIndex: $0.game_index,
                generation: GenerationName(rawValue: $0.generation.name)
            )
        }
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let sprites = Sprites(default: apiModel.sprites.default)
        let heldByPokemon = apiModel.held_by_pokemon.map {
            HeldPokemon(
                pokemon: PokemonName(rawValue: $0.pokemon.name),
                versionDetails: $0.version_details.map {
                    HeldPokemon.VersionDetail(
                        rarity: $0.rarity,
                        version: VersionName(rawValue: $0.version.name)
                    )
                }
            )
        }
        let babyTriggerFor = apiModel.baby_trigger_for?.url

        self.init(
            id: id, name: name, cost: cost, flingPower: flingPower,
            flingEffect: flingEffect, attributes: attributes, category: category,
            effectEntries: effectEntries, flavorTextEntries: flavorTextEntries,
            gameIndices: gameIndices, names: names, sprites: sprites,
            heldByPokemon: heldByPokemon, babyTriggerFor: babyTriggerFor
        )
    }
}

extension ItemAttribute {
    init(apiModel: ItemAttributeResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let items = apiModel.items.map { ItemName(rawValue: $0.name) }
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let descriptions = apiModel.descriptions.map {
            Description(description: $0.description, language: LanguageName(rawValue: $0.language.name))
        }

        self.init(id: id, name: name, items: items, names: names, descriptions: descriptions)
    }
}

extension ItemCategory {
    init(apiModel: ItemCategoryResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let items = apiModel.items.map { ItemName(rawValue: $0.name) }
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }
        let pocket = ItemPocketName(rawValue: apiModel.pocket.name)

        self.init(id: id, name: name, items: items, names: names, pocket: pocket)
    }
}

extension ItemFlingEffect {
    init(apiModel: ItemFlingEffectResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let effectEntries = apiModel.effect_entries.map {
            Effect(effect: $0.effect, language: LanguageName(rawValue: $0.language.name))
        }
        let items = apiModel.items.map { ItemName(rawValue: $0.name) }

        self.init(id: id, name: name, effectEntries: effectEntries, items: items)
    }
}

extension ItemPocket {
    init(apiModel: ItemPocketResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let categories = apiModel.categories.map { ItemCategoryName(rawValue: $0.name) }
        let names = apiModel.names.map {
            Name(name: $0.name, language: LanguageName(rawValue: $0.language.name))
        }

        self.init(id: id, name: name, categories: categories, names: names)
    }
}
