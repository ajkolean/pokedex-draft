// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  struct RegionFragment: GraphClient.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment RegionFragment on pokemon_v2_region { __typename id name generation: pokemon_v2_generation { __typename id name } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_region }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
      .field("pokemon_v2_generation", alias: "generation", Generation?.self),
    ] }

    var id: Int { __data["id"] }
    var name: String { __data["name"] }
    /// An object relationship
    var generation: Generation? { __data["generation"] }

    /// Generation
    ///
    /// Parent Type: `Pokemon_v2_generation`
    struct Generation: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_generation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String.self),
      ] }

      var id: Int { __data["id"] }
      var name: String { __data["name"] }
    }
  }

}