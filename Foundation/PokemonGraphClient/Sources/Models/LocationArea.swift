import Foundation
import Models

extension LocationArea {
    init(_ apiModel: GraphClient.LocationAreaFragment) {
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            encouters: apiModel.encounters
                .compactMap {
                    guard let fragment = $0.pokemon.map({ PokemonSummary($0.fragments.pokemonSummaryFragment) })
                    else { return nil }
                    return Encounter(minLevel: $0.minLevl, maxLevel: $0.maxLevel, pokemon: fragment)
                }
                .filterRemovingDuplicates { encouter in
                    encouter.pokemon.id
                }
        )
    }
}
