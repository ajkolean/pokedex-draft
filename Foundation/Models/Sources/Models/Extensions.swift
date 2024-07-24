
import Foundation

extension URL {
    public func extractID() -> Int? {
        let components = self.pathComponents
        guard let idString = components.last, let id = Int(idString) else {
            return nil
        }
        
        return id
    }
}
