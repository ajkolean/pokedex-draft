// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GraphClient_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphClient.SchemaMetadata {}

protocol GraphClient_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphClient.SchemaMetadata {}

protocol GraphClient_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphClient.SchemaMetadata {}

protocol GraphClient_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphClient.SchemaMetadata {}

extension GraphClient {
  typealias SelectionSet = GraphClient_SelectionSet

  typealias InlineFragment = GraphClient_InlineFragment

  typealias MutableSelectionSet = GraphClient_MutableSelectionSet

  typealias MutableInlineFragment = GraphClient_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "query_root": return GraphClient.Objects.Query_root
      case "pokemon_v2_pokemon": return GraphClient.Objects.Pokemon_v2_pokemon
      case "pokemon_v2_pokemontype": return GraphClient.Objects.Pokemon_v2_pokemontype
      case "pokemon_v2_type": return GraphClient.Objects.Pokemon_v2_type
      case "pokemon_v2_pokemonstat": return GraphClient.Objects.Pokemon_v2_pokemonstat
      case "pokemon_v2_stat": return GraphClient.Objects.Pokemon_v2_stat
      case "pokemon_v2_pokemonspecies": return GraphClient.Objects.Pokemon_v2_pokemonspecies
      case "pokemon_v2_pokemonspeciesflavortext": return GraphClient.Objects.Pokemon_v2_pokemonspeciesflavortext
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}