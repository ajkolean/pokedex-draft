// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  class GetPokemonTypeListQuery: GraphQLQuery {
    static let operationName: String = "GetPokemonTypeList"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetPokemonTypeList($limit: Int, $offset: Int) { types: pokemon_v2_type(limit: $limit, offset: $offset) { __typename ...TypeFragment } }"#,
        fragments: [PokemonFragment.self, TypeFragment.self]
      ))

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
      "offset": offset
    ] }

    struct Data: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
      static var __selections: [ApolloAPI.Selection] { [
        .field("pokemon_v2_type", alias: "types", [Type_SelectionSet].self, arguments: [
          "limit": .variable("limit"),
          "offset": .variable("offset")
        ]),
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