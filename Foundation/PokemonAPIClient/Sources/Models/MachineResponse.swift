import Foundation

struct MachineResponse: Codable {
    /// The identifier for this resource.
    let id: MachineID
    /// The TM or HM item that corresponds to this machine.
    let item: NamedAPIResource
    /// The move that is taught by this machine.
    let move: NamedAPIResource
    /// The version group that this machine applies to.
    let version_group: NamedAPIResource
}
