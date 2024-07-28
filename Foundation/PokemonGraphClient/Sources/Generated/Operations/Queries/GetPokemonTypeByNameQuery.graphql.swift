@_exported import ApolloAPI

extension GraphClient {
    class GetPokemonTypeByNameQuery: GraphQLQuery {
        static let operationName: String = "GetPokemonTypeByName"
        static let operationDocument: ApolloAPI.OperationDocument = .init(
            definition: .init(
                #"query GetPokemonTypeByName($name: String!) { types: pokemon_v2_type(where: { name: { _eq: $name } }) { __typename ...TypeFragment } }"#,
                fragments: [PokemonFragment.self, TypeFragment.self]
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
                    "pokemon_v2_type",
                    alias: "types",
                    [Type_SelectionSet].self,
                    arguments: ["where": ["name": ["_eq": .variable("name")]]]
                ),
            ] }

            /// fetch data from the table: "pokemon_v2_type"
            var types: [Type_SelectionSet] { __data["types"] }

            /// Type_SelectionSet
            ///
            /// Parent Type: `Pokemon_v2_type`
            struct Type_SelectionSet: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_type }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .fragment(TypeFragment.self),
                ] }

                var id: Int { __data["id"] }
                var name: String { __data["name"] }
                /// An array relationship
                var attackDamageRelations: [AttackDamageRelation] { __data["attackDamageRelations"] }
                /// An array relationship
                var defenseDamageRelation: [DefenseDamageRelation] { __data["defenseDamageRelation"] }
                /// An array relationship
                var pokemonByTypeSlot: [PokemonByTypeSlot] { __data["pokemonByTypeSlot"] }

                struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var typeFragment: TypeFragment { _toFragment() }
                }

                typealias AttackDamageRelation = TypeFragment.AttackDamageRelation

                typealias DefenseDamageRelation = TypeFragment.DefenseDamageRelation

                typealias PokemonByTypeSlot = TypeFragment.PokemonByTypeSlot
            }
        }
    }
}
