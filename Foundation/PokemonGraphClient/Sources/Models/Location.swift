import Foundation
import Models

extension Location {
    init(_ apiModel: GraphClient.LocationFramgment) {
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            areas: apiModel.areas.map { Area(_id: $0.id, _name: $0.name) }
        )
    }
}
