@_exported import ApolloAPI

extension GraphClient {
    class GetPokemonByNameQuery: GraphQLQuery {
        static let operationName: String = "GetPokemonByName"
        static let operationDocument: ApolloAPI.OperationDocument = .init(
            definition: .init(
                #"query GetPokemonByName($name: String!) { pokemon: pokemon_v2_pokemon(where: { name: { _eq: $name } }) { __typename ...PokemonFragment } }"#,
                fragments: [PokemonFragment.self]
            )
        )

        public var name: String

        public init(name: String) {
            self.name = name
        }

        public var __variables: Variables? { ["name": name] }

        struct Data: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
            static var __selections: [ApolloAPI.Selection] { [
                .field(
                    "pokemon_v2_pokemon",
                    alias: "pokemon",
                    [Pokemon].self,
                    arguments: ["where": ["name": ["_eq": .variable("name")]]]
                ),
            ] }

            /// fetch data from the table: "pokemon_v2_pokemon"
            var pokemon: [Pokemon] { __data["pokemon"] }

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
