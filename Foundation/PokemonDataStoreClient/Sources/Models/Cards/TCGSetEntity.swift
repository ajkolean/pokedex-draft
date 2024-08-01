import Foundation
import Models
import SwiftData

@Model
public final class TCGSetEntity {
    @Attribute(.unique)
    public var id: String
    public var name: String
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

