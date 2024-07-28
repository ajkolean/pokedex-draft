@_exported import ApolloAPI

extension GraphClient {
    struct PokemonFragment: GraphClient.SelectionSet, Fragment {
        static var fragmentDefinition: StaticString {
            #"fragment PokemonFragment on pokemon_v2_pokemon { __typename id name height weight order baseExperience: base_experience types: pokemon_v2_pokemontypes { __typename slot type: pokemon_v2_type { __typename id name } } stats: pokemon_v2_pokemonstats { __typename base_stat effort statName: pokemon_v2_stat { __typename name } } species: pokemon_v2_pokemonspecy { __typename descriptions: pokemon_v2_pokemonspeciesflavortexts( limit: 2 where: { language_id: { _eq: 9 } } ) { __typename text: flavor_text } } }"#
        }

        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemon }
        static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("height", Int?.self),
            .field("weight", Int?.self),
            .field("order", Int?.self),
            .field("base_experience", alias: "baseExperience", Int?.self),
            .field("pokemon_v2_pokemontypes", alias: "types", [Type_SelectionSet].self),
            .field("pokemon_v2_pokemonstats", alias: "stats", [Stat].self),
            .field("pokemon_v2_pokemonspecy", alias: "species", Species?.self),
        ] }

        var id: Int { __data["id"] }
        var name: String { __data["name"] }
        var height: Int? { __data["height"] }
        var weight: Int? { __data["weight"] }
        var order: Int? { __data["order"] }
        var baseExperience: Int? { __data["baseExperience"] }
        /// An array relationship
        var types: [Type_SelectionSet] { __data["types"] }
        /// An array relationship
        var stats: [Stat] { __data["stats"] }
        /// An object relationship
        var species: Species? { __data["species"] }

        /// Type_SelectionSet
        ///
        /// Parent Type: `Pokemon_v2_pokemontype`
        struct Type_SelectionSet: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemontype }
            static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("slot", Int.self),
                .field("pokemon_v2_type", alias: "type", Type_SelectionSet?.self),
            ] }

            var slot: Int { __data["slot"] }
            /// An object relationship
            var type: Type_SelectionSet? { __data["type"] }

            /// Type_SelectionSet.Type_SelectionSet
            ///
            /// Parent Type: `Pokemon_v2_type`
            struct Type_SelectionSet: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_type }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("id", Int.self),
                    .field("name", String.self),
                ] }

                var id: Int { __data["id"] }
                var name: String { __data["name"] }
            }
        }

        /// Stat
        ///
        /// Parent Type: `Pokemon_v2_pokemonstat`
        struct Stat: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemonstat }
            static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("base_stat", Int.self),
                .field("effort", Int.self),
                .field("pokemon_v2_stat", alias: "statName", StatName?.self),
            ] }

            var base_stat: Int { __data["base_stat"] }
            var effort: Int { __data["effort"] }
            /// An object relationship
            var statName: StatName? { __data["statName"] }

            /// Stat.StatName
            ///
            /// Parent Type: `Pokemon_v2_stat`
            struct StatName: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_stat }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("name", String.self),
                ] }

                var name: String { __data["name"] }
            }
        }

        /// Species
        ///
        /// Parent Type: `Pokemon_v2_pokemonspecies`
        struct Species: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemonspecies }
            static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("pokemon_v2_pokemonspeciesflavortexts", alias: "descriptions", [Description].self, arguments: [
                    "limit": 2,
                    "where": ["language_id": ["_eq": 9]],
                ]),
            ] }

            /// An array relationship
            var descriptions: [Description] { __data["descriptions"] }

            /// Species.Description
            ///
            /// Parent Type: `Pokemon_v2_pokemonspeciesflavortext`
            struct Description: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemonspeciesflavortext }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("flavor_text", alias: "text", String.self),
                ] }

                var text: String { __data["text"] }
            }
        }
    }
}