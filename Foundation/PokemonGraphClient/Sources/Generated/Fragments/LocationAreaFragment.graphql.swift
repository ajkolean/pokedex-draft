@_exported import ApolloAPI

extension GraphClient {
    struct LocationAreaFragment: GraphClient.SelectionSet, Fragment {
        static var fragmentDefinition: StaticString {
            #"fragment LocationAreaFragment on pokemon_v2_locationarea { __typename id name encounters: pokemon_v2_encounters { __typename minLevl: min_level maxLevel: max_level pokemon: pokemon_v2_pokemon { __typename ...PokemonFragment } } }"#
        }

        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_locationarea }
        static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("pokemon_v2_encounters", alias: "encounters", [Encounter].self),
        ] }

        var id: Int { __data["id"] }
        var name: String { __data["name"] }
        /// An array relationship
        var encounters: [Encounter] { __data["encounters"] }

        /// Encounter
        ///
        /// Parent Type: `Pokemon_v2_encounter`
        struct Encounter: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_encounter }
            static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("min_level", alias: "minLevl", Int.self),
                .field("max_level", alias: "maxLevel", Int.self),
                .field("pokemon_v2_pokemon", alias: "pokemon", Pokemon?.self),
            ] }

            var minLevl: Int { __data["minLevl"] }
            var maxLevel: Int { __data["maxLevel"] }
            /// An object relationship
            var pokemon: Pokemon? { __data["pokemon"] }

            /// Encounter.Pokemon
            ///
            /// Parent Type: `Pokemon_v2_pokemon`
            struct Pokemon: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemon }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .fragment(PokemonFragment.self),
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

                struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var pokemonFragment: PokemonFragment { _toFragment() }
                }

                typealias Type_SelectionSet = PokemonFragment.Type_SelectionSet

                typealias Stat = PokemonFragment.Stat

                typealias Species = PokemonFragment.Species
            }
        }
    }
}
