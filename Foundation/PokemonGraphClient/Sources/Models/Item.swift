import Foundation
import Models

extension ItemCategory {
    init(_ apiModel: GraphClient.ItemCategoryFragment) {
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            items: apiModel.items.map { Item($0.fragments.itemFragment) },
            pocket: apiModel.itemPocket?.name
        )
    }
}

extension Item {
    init(_ apiModel: GraphClient.ItemFragment) {
        self.init(
            _id: apiModel.id,
            _name: apiModel.name,
            flingPower: apiModel.flingPower,
            cost: apiModel.cost,
            flavorText: apiModel.flavorText.first?.flavor_text,
            effectText: apiModel.effectText.first?.effect,
            flingEffect: apiModel.flingEffect?.name
        )
    }
}
