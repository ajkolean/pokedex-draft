@_exported import ApolloAPI

extension GraphClient {
    class GetItemCategoriesQuery: GraphQLQuery {
        static let operationName: String = "GetItemCategories"
        static let operationDocument: ApolloAPI.OperationDocument = .init(
            definition: .init(
                #"query GetItemCategories { categories: pokemon_v2_itemcategory { __typename ...ItemCategoryFragment } }"#,
                fragments: [ItemCategoryFragment.self, ItemFragment.self]
            )
        )

        public init() {}

        struct Data: GraphClient.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Query_root }
            static var __selections: [ApolloAPI.Selection] { [
                .field("pokemon_v2_itemcategory", alias: "categories", [Category].self),
            ] }

            /// fetch data from the table: "pokemon_v2_itemcategory"
            var categories: [Category] { __data["categories"] }

            /// Category
            ///
            /// Parent Type: `Pokemon_v2_itemcategory`
            struct Category: GraphClient.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_itemcategory }
                static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .fragment(ItemCategoryFragment.self),
                ] }

                var id: Int { __data["id"] }
                var name: String { __data["name"] }
                /// An array relationship
                var items: [Item] { __data["items"] }
                /// An object relationship
                var itemPocket: ItemPocket? { __data["itemPocket"] }

                struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var itemCategoryFragment: ItemCategoryFragment { _toFragment() }
                }

                /// Category.Item
                ///
                /// Parent Type: `Pokemon_v2_item`
                struct Item: GraphClient.SelectionSet {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_item }

                    var id: Int { __data["id"] }
                    var name: String { __data["name"] }
                    var cost: Int? { __data["cost"] }
                    var flingPower: Int? { __data["flingPower"] }
                    /// An array relationship
                    var flavorText: [FlavorText] { __data["flavorText"] }
                    /// An array relationship
                    var effectText: [EffectText] { __data["effectText"] }
                    /// An object relationship
                    var flingEffect: FlingEffect? { __data["flingEffect"] }

                    struct Fragments: FragmentContainer {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        var itemFragment: ItemFragment { _toFragment() }
                    }

                    typealias FlavorText = ItemFragment.FlavorText

                    typealias EffectText = ItemFragment.EffectText

                    typealias FlingEffect = ItemFragment.FlingEffect
                }

                typealias ItemPocket = ItemCategoryFragment.ItemPocket
            }
        }
    }
}
