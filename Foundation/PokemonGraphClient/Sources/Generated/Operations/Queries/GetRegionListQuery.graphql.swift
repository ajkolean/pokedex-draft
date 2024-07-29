// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  class GetRegionListQuery: GraphQLQuery {
    static let operationName: String = "GetRegionList"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetRegionList { regions: pokemon_v2_region { __typename ...RegionFragment } }"#,
        fragments: [RegionFragment.self]
      ))

    public init() {}

    struct Data: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
      static var __selections: [ApolloAPI.Selection] { [
        .field("pokemon_v2_region", alias: "regions", [Region].self),
      ] }

      /// fetch data from the table: "pokemon_v2_region"
      var regions: [Region] { __data["regions"] }

      /// Region
      ///
      /// Parent Type: `Pokemon_v2_region`
      struct Region: GraphClient.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_region }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(RegionFragment.self),
        ] }

        var id: Int { __data["id"] }
        var name: String { __data["name"] }
        /// An object relationship
        var generation: Generation? { __data["generation"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var regionFragment: RegionFragment { _toFragment() }
        }

        typealias Generation = RegionFragment.Generation
      }
    }
  }
}