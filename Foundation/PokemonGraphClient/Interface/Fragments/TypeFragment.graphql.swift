// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphClient {
  struct TypeFragment: GraphClient.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment TypeFragment on pokemon_v2_type { __typename id name attackDamageRelations: pokemon_v2_typeefficacies( where: { damage_factor: { _in: [200, 0, 50] } } ) { __typename damageFactor: damage_factor targetType: pokemonV2TypeByTargetTypeId { __typename name } } defenseDamageRelation: pokemonV2TypeefficaciesByTargetTypeId( where: { damage_factor: { _in: [200, 0, 50] } } ) { __typename damageFactor: damage_factor targetType: pokemon_v2_type { __typename name } } pokemonByTypeSlot: pokemon_v2_pokemontypes { __typename typeSlot: slot pokemonID: pokemon_id pokemon: pokemon_v2_pokemon { __typename ...PokemonFragment } } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_type }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
      .field("pokemon_v2_typeefficacies", alias: "attackDamageRelations", [AttackDamageRelation].self, arguments: ["where": ["damage_factor": ["_in": [200, 0, 50]]]]),
      .field("pokemonV2TypeefficaciesByTargetTypeId", alias: "defenseDamageRelation", [DefenseDamageRelation].self, arguments: ["where": ["damage_factor": ["_in": [200, 0, 50]]]]),
      .field("pokemon_v2_pokemontypes", alias: "pokemonByTypeSlot", [PokemonByTypeSlot].self),
    ] }

    var id: Int { __data["id"] }
    var name: String { __data["name"] }
    /// An array relationship
    var attackDamageRelations: [AttackDamageRelation] { __data["attackDamageRelations"] }
    /// An array relationship
    var defenseDamageRelation: [DefenseDamageRelation] { __data["defenseDamageRelation"] }
    /// An array relationship
    var pokemonByTypeSlot: [PokemonByTypeSlot] { __data["pokemonByTypeSlot"] }

    /// AttackDamageRelation
    ///
    /// Parent Type: `Pokemon_v2_typeefficacy`
    struct AttackDamageRelation: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_typeefficacy }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("damage_factor", alias: "damageFactor", Int.self),
        .field("pokemonV2TypeByTargetTypeId", alias: "targetType", TargetType?.self),
      ] }

      var damageFactor: Int { __data["damageFactor"] }
      /// An object relationship
      var targetType: TargetType? { __data["targetType"] }

      /// AttackDamageRelation.TargetType
      ///
      /// Parent Type: `Pokemon_v2_type`
      struct TargetType: GraphClient.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_type }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        var name: String { __data["name"] }
      }
    }

    /// DefenseDamageRelation
    ///
    /// Parent Type: `Pokemon_v2_typeefficacy`
    struct DefenseDamageRelation: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_typeefficacy }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("damage_factor", alias: "damageFactor", Int.self),
        .field("pokemon_v2_type", alias: "targetType", TargetType?.self),
      ] }

      var damageFactor: Int { __data["damageFactor"] }
      /// An object relationship
      var targetType: TargetType? { __data["targetType"] }

      /// DefenseDamageRelation.TargetType
      ///
      /// Parent Type: `Pokemon_v2_type`
      struct TargetType: GraphClient.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_type }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        var name: String { __data["name"] }
      }
    }

    /// PokemonByTypeSlot
    ///
    /// Parent Type: `Pokemon_v2_pokemontype`
    struct PokemonByTypeSlot: GraphClient.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemontype }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("slot", alias: "typeSlot", Int.self),
        .field("pokemon_id", alias: "pokemonID", Int?.self),
        .field("pokemon_v2_pokemon", alias: "pokemon", Pokemon?.self),
      ] }

      var typeSlot: Int { __data["typeSlot"] }
      var pokemonID: Int? { __data["pokemonID"] }
      /// An object relationship
      var pokemon: Pokemon? { __data["pokemon"] }

      /// PokemonByTypeSlot.Pokemon
      ///
      /// Parent Type: `Pokemon_v2_pokemon`
      struct Pokemon: GraphClient.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphClient.Objects.Pokemon_v2_pokemon }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(PokemonFragment.self),
        ] }

        var id: Int { __data["id"] }
        var name: String { __data["name"] }
        var height: Int? { __data["height"] }
        var weight: Int? { __data["weight"] }
        var order: Int? { __data["order"] }
        var baseExperience: Int? { __data["baseExperience"] }
        /// An array relationship
        var types: [Type_SelectionSet] { __data["types"] }
        /// An array relationship
        var stats: [Stat] { __data["stats"] }
        /// An object relationship
        var species: Species? { __data["species"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var pokemonFragment: PokemonFragment { _toFragment() }
        }

        typealias Type_SelectionSet = PokemonFragment.Type_SelectionSet

        typealias Stat = PokemonFragment.Stat

        typealias Species = PokemonFragment.Species
      }
    }
  }

}