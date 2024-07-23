import Foundation
import SwiftData

@Model
public class PokemonIdentifierEntity {
    public var id: Int
    @Attribute(.unique)
    public var name: String
    public var url: URL
    
    public init(id: Int, name: PokemonName, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
    
    public var asModel: PokemonIdentifier {
        .init(id: id, name: PokemonName(name), url: url)
    }
}
