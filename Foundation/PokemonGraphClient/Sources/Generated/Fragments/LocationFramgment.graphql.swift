@_exported import ApolloAPI

extension GraphClient {
    struct LocationFramgment: GraphClient.SelectionSet, Fragment {
        static var fragmentDefinition: StaticString {
            #"fragment LocationFramgment on pokemon_v2_location { __typename id name areas: pokemon_v2_locationareas { __typename id name } }"#
        }

        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_location }
        static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("pokemon_v2_locationareas", alias: "areas", [Area].self),
        ] }

        var id: Int { __data["id"] }
        var name: String { __data["name"] }
        /// An array relationship
        var areas: [Area] { __data["areas"] }

        /// Area
        ///
        /// Parent Type: `Pokemon_v2_locationarea`
        struct Area: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_locationarea }
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
