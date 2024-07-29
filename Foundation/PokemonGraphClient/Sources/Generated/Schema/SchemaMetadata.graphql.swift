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
      case "pokemon_v2_type": return GraphClient.Objects.Pokemon_v2_type
      case "pokemon_v2_typeefficacy": return GraphClient.Objects.Pokemon_v2_typeefficacy
      case "pokemon_v2_pokemontype": return GraphClient.Objects.Pokemon_v2_pokemontype
      case "pokemon_v2_pokemon": return GraphClient.Objects.Pokemon_v2_pokemon
      case "pokemon_v2_pokemonstat": return GraphClient.Objects.Pokemon_v2_pokemonstat
      case "pokemon_v2_stat": return GraphClient.Objects.Pokemon_v2_stat
      case "pokemon_v2_pokemonspecies": return GraphClient.Objects.Pokemon_v2_pokemonspecies
      case "pokemon_v2_pokemonspeciesflavortext": return GraphClient.Objects.Pokemon_v2_pokemonspeciesflavortext
      case "pokemon_v2_evolutionchain": return GraphClient.Objects.Pokemon_v2_evolutionchain
      case "pokemon_v2_pokemonevolution": return GraphClient.Objects.Pokemon_v2_pokemonevolution
      case "pokemon_v2_evolutiontrigger": return GraphClient.Objects.Pokemon_v2_evolutiontrigger
      case "pokemon_v2_itemcategory": return GraphClient.Objects.Pokemon_v2_itemcategory
      case "pokemon_v2_item": return GraphClient.Objects.Pokemon_v2_item
      case "pokemon_v2_itemflavortext": return GraphClient.Objects.Pokemon_v2_itemflavortext
      case "pokemon_v2_itemeffecttext": return GraphClient.Objects.Pokemon_v2_itemeffecttext
      case "pokemon_v2_itemflingeffect": return GraphClient.Objects.Pokemon_v2_itemflingeffect
      case "pokemon_v2_itempocket": return GraphClient.Objects.Pokemon_v2_itempocket
      case "pokemon_v2_region": return GraphClient.Objects.Pokemon_v2_region
      case "pokemon_v2_generation": return GraphClient.Objects.Pokemon_v2_generation
      case "pokemon_v2_location": return GraphClient.Objects.Pokemon_v2_location
      case "pokemon_v2_locationarea": return GraphClient.Objects.Pokemon_v2_locationarea
      case "pokemon_v2_encounter": return GraphClient.Objects.Pokemon_v2_encounter
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}