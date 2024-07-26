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
        self.id = apiModel.id
        self.item = ItemName(rawValue: apiModel.item.name)
        self.move = MoveName(rawValue: apiModel.move.name)
        self.versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
    }
}
