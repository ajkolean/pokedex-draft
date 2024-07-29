import Foundation
import Models

extension Region {
    init(_ apiModel: GraphClient.RegionFragment) {
        let generation = apiModel.generation.map { Generation(_id: $0.id, _name: $0.name) }
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            generation: generation ?? nil
        )
    }
}
