// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  class GetLocationAreaQuery: GraphQLQuery {
    static let operationName: String = "GetLocationArea"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetLocationArea($id: Int) { area: pokemon_v2_locationarea(limit: 1, where: { id: { _eq: $id } }) { __typename ...LocationAreaFragment } }"#,
        fragments: [LocationAreaFragment.self, PokemonFragment.self]
      ))

    public var id: GraphQLNullable<Int>

    public init(id: GraphQLNullable<Int>) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
      static var __selections: [ApolloAPI.Selection] { [
        .field("pokemon_v2_locationarea", alias: "area", [Area].self, arguments: [
          "limit": 1,
          "where": ["id": ["_eq": .variable("id")]]
        ]),
      ] }

      /// fetch data from the table: "pokemon_v2_locationarea"
      var area: [Area] { __data["area"] }

      /// Area
      ///
      /// Parent Type: `Pokemon_v2_locationarea`
      struct Area: GraphClient.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_locationarea }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(LocationAreaFragment.self),
        ] }

        var id: Int { __data["id"] }
        var name: String { __data["name"] }
        /// An array relationship
        var encounters: [Encounter] { __data["encounters"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var locationAreaFragment: LocationAreaFragment { _toFragment() }
        }

        typealias Encounter = LocationAreaFragment.Encounter
      }
    }
  }
}