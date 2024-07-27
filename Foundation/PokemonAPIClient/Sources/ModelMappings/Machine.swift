import Foundation

extension Machine {
    init(apiModel: MachineResponse) {
        let id = apiModel.id
        let item = ItemName(rawValue: apiModel.item.name)
        let move = MoveName(rawValue: apiModel.move.name)
        let versionGroup = VersionGroupName(rawValue: apiModel.version_group.name)
        self.init(id: id, item: item, move: move, versionGroup: versionGroup)
    }
}
