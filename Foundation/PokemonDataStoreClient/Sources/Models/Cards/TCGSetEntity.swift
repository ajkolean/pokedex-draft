import Foundation
import Models
import SwiftData

public protocol ExpirableEntity {
    var expiresAt: Date { get set }
}

@Model
public final class TCGSetEntity: ExpirableEntity {
    @Attribute(.unique)
    public var id: String
    public var name: String
    public var expiresAt = Date.expirationDate
    public var setModel: TCG.Set

    public init(id: String, name: String, setModel: TCG.Set) {
        self.id = id
        self.name = name
        self.setModel = setModel
    }
}

extension TCGSetEntity {
    convenience init(_ model: TCG.Set) {
        self.init(
            id: model.id,
            name: model.name,
            setModel: model
        )
    }
}
