import Foundation
import MemberwiseInit

// Domain model for Machine
@MemberwiseInit(.public)
public struct Machine: Codable, Hashable, Identifiable {
    public let id: MachineID
    public let item: ItemName
    public let move: MoveName
    public let versionGroup: VersionGroupName
}
