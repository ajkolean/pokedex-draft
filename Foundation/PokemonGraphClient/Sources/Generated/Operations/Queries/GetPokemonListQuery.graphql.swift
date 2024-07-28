@_exported import ApolloAPI

extension GraphClient {
    class GetPokemonListQuery: GraphQLQuery {
        static let operationName: String = "GetPokemonList"
        static let operationDocument: ApolloAPI.OperationDocument = .init(
            definition: .init(
                #"query GetPokemonList($limit: Int, $offset: Int) { pokemons: pokemon_v2_pokemon(limit: $limit, offset: $offset) { __typename ...PokemonFragment } }"#,
                fragments: [PokemonFragment.self]
            )
        )

        public var limit: GraphQLNullable<Int>
        public var offset: GraphQLNullable<Int>

        public init(
            limit: GraphQLNullable<Int>,
            offset: GraphQLNullable<Int>
        ) {
            self.limit = limit
            self.offset = offset
        }

        public var __variables: Variables? { [
            "limit": limit,
            "offset": offset,
        ] }

        struct Data: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
            static var __selections: [ApolloAPI.Selection] { [
                .field("pokemon_v2_pokemon", alias: "pokemons", [Pokemon].self, arguments: [
                    "limit": .variable("limit"),
                    "offset": .variable("offset"),
                ]),
            ] }

            /// fetch data from the table: "pokemon_v2_pokemon"
            var pokemons: [Pokemon] { __data["pokemons"] }

            /// Pokemon
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
