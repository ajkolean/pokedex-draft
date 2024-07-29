// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  struct ItemCategoryFragment: GraphClient.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment ItemCategoryFragment on pokemon_v2_itemcategory { __typename id name items: pokemon_v2_items { __typename ...ItemFragment } itemPocket: pokemon_v2_itempocket { __typename name } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_itemcategory }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
      .field("pokemon_v2_items", alias: "items", [Item].self),
      .field("pokemon_v2_itempocket", alias: "itemPocket", ItemPocket?.self),
    ] }

    var id: Int { __data["id"] }
    var name: String { __data["name"] }
    /// An array relationship
    var items: [Item] { __data["items"] }
    /// An object relationship
    var itemPocket: ItemPocket? { __data["itemPocket"] }

    /// Item
    ///
    /// Parent Type: `Pokemon_v2_item`
    struct Item: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_item }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(ItemFragment.self),
      ] }

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

    /// ItemPocket
    ///
    /// Parent Type: `Pokemon_v2_itempocket`
    struct ItemPocket: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_itempocket }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
      ] }

      var name: String { __data["name"] }
    }
  }

}