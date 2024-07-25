import Foundation

extension URL {
    public func extractID() -> Int {
        let components = pathComponents
        guard let idString = components.last, let id = Int(idString) else {
            fatalError("Failed to extract id: \(components.joined(separator: "/"))")
        }

        return id
    }
}
