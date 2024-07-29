// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  struct ItemFragment: GraphClient.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment ItemFragment on pokemon_v2_item { __typename id name cost flingPower: fling_power flavorText: pokemon_v2_itemflavortexts(limit: 1) { __typename flavor_text } effectText: pokemon_v2_itemeffecttexts { __typename effect } flingEffect: pokemon_v2_itemflingeffect { __typename name } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_item }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
      .field("cost", Int?.self),
      .field("fling_power", alias: "flingPower", Int?.self),
      .field("pokemon_v2_itemflavortexts", alias: "flavorText", [FlavorText].self, arguments: ["limit": 1]),
      .field("pokemon_v2_itemeffecttexts", alias: "effectText", [EffectText].self),
      .field("pokemon_v2_itemflingeffect", alias: "flingEffect", FlingEffect?.self),
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

    /// FlavorText
    ///
    /// Parent Type: `Pokemon_v2_itemflavortext`
    struct FlavorText: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_itemflavortext }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("flavor_text", String.self),
      ] }

      var flavor_text: String { __data["flavor_text"] }
    }

    /// EffectText
    ///
    /// Parent Type: `Pokemon_v2_itemeffecttext`
    struct EffectText: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_itemeffecttext }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("effect", String.self),
      ] }

      var effect: String { __data["effect"] }
    }

    /// FlingEffect
    ///
    /// Parent Type: `Pokemon_v2_itemflingeffect`
    struct FlingEffect: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_itemflingeffect }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
      ] }

      var name: String { __data["name"] }
    }
  }

}