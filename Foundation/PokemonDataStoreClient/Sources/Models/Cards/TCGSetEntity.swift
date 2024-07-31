import Foundation
import Models
import SwiftData

@Model
public final class TCGSetEntity {
    @Attribute(.unique)
    public let id: String
    public let name: String
    public let series: String
    public let printedTotal: Int
    public let total: Int
    public let ptcgoCode: String?
    public let releaseDate: Date
    public let updatedAt: Date
    public let images: TCG.Set.Image

    public init(
        id: String,
        name: String,
        series: String,
        printedTotal: Int,
        total: Int,
        ptcgoCode: String?,
        releaseDate: Date,
        updatedAt: Date,
        images: TCG.Set.Image
    ) {
        self.id = id
        self.name = name
        self.series = series
        self.printedTotal = printedTotal
        self.total = total
        self.ptcgoCode = ptcgoCode
        self.releaseDate = releaseDate
        self.updatedAt = updatedAt
        self.images = images
    }
}

extension TCGSetEntity {
    convenience init(_ model: TCG.Set) {
        self.init(
            id: model.id.rawValue,
            name: model.name.rawValue,
            series: model.series,
            printedTotal: model.printedTotal,
            total: model.total,
            ptcgoCode: model.ptcgoCode,
            releaseDate: model.releaseDate,
            updatedAt: model.updatedAt,
            images: model.images
        )
    }
}

extension TCG.Set {
    init(_ entity: TCGSetEntity) {
        self.init(
            id: TCG.Set.ID(rawValue: entity.id),
            name: TCG.Set.Name(rawValue: entity.name),
            series: entity.series,
            printedTotal: entity.printedTotal,
            total: entity.total,
            ptcgoCode: entity.ptcgoCode,
            releaseDate: entity.releaseDate,
            updatedAt: entity.updatedAt,
            images: entity.images
        )
    }
}
