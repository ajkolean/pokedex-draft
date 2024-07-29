@_exported import ApolloAPI

extension GraphClient {
    class GetLocationsListQuery: GraphQLQuery {
        static let operationName: String = "GetLocationsList"
        static let operationDocument: ApolloAPI.OperationDocument = .init(
            definition: .init(
                #"query GetLocationsList { pokemon_v2_location { __typename ...LocationFramgment } }"#,
                fragments: [LocationFramgment.self]
            )
        )

        public init() {}

        struct Data: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
            static var __selections: [ApolloAPI.Selection] { [
                .field("pokemon_v2_location", [Pokemon_v2_location].self),
            ] }

            /// fetch data from the table: "pokemon_v2_location"
            var pokemon_v2_location: [Pokemon_v2_location] { __data["pokemon_v2_location"] }

            /// Pokemon_v2_location
            ///
            /// Parent Type: `Pokemon_v2_location`
            struct Pokemon_v2_location: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_location }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .fragment(LocationFramgment.self),
                ] }

                var id: Int { __data["id"] }
                var name: String { __data["name"] }
                /// An array relationship
                var areas: [Area] { __data["areas"] }

                struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var locationFramgment: LocationFramgment { _toFragment() }
                }

                typealias Area = LocationFramgment.Area
            }
        }
    }
}
