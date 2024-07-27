import Foundation

// Domain model for Machine
public struct Machine: Codable, Hashable, Identifiable {
    public let id: MachineID
    public let item: ItemName
    public let move: MoveName
    public let versionGroup: VersionGroupName
}

extension Machine {
    init(apiModel: MachineResponse) {
        id = apiModel.id
        item = ItemName(rawValue: apiModel.item.name)
        move = MoveName(rawValue: apiModel.move.name)
        versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}
