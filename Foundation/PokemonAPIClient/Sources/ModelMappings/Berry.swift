import Foundation

extension Berry {
    init(apiModel: BerryResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let growthTime = apiModel.growth_time
        let maxHarvest = apiModel.max_harvest
        let size = apiModel.size
        let firmness = apiModel.firmness.name
        let flavors = apiModel.flavors.map { Flavor(name: $0.flavor.name, potency: $0.potency) }
        let item = ItemName(rawValue: apiModel.item.name)
        let naturalGiftType = TypeName(rawValue: apiModel.natural_gift_type.name)

        self.init(
            id: id,
            name: name,
            growthTime: growthTime,
            maxHarvest: maxHarvest,
            size: size,
            firmness: firmness,
            flavors: flavors,
            item: item,
            naturalGiftType: naturalGiftType
        )
    }
}

extension BerryFirmness {
    init(apiModel: BerryFirmnessResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let berries = apiModel.berries.map { BerryName(rawValue: $0.name) }
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }

        self.init(id: id, name: name, berries: berries, names: names)
    }
}

extension BerryFlavor {
    init(apiModel: BerryFlavorResponse) {
        let id = apiModel.id
        let name = apiModel.name
        let berries = apiModel.berries.map { FlavorBerryMap(potency: $0.potency, berry: BerryName(rawValue: $0.berry.name)) }
        let contestType = ContestTypeName(rawValue: apiModel.contest_type.name)
        let names = apiModel.names.map { Name(name: $0.name, language: LanguageName(rawValue: $0.language.name)) }

        self.init(id: id, name: name, berries: berries, contestType: contestType, names: names)
    }
}
