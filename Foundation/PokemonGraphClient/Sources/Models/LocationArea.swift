import Foundation
import Models

extension LocationArea {
    init(_ apiModel: GraphClient.LocationAreaFragment) {
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            encouters: apiModel.encounters.compactMap {
                guard let fragment = $0.pokemon.map({ Pokemon($0.fragments.pokemonFragment) }) else { return nil }
                return Encounter(minLevel: $0.minLevl, maxLevel: $0.maxLevel, pokemon: fragment)
            }
        )
    }
}
