import Foundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct Name: Codable, Hashable {
    public let name: String
    public let language: LanguageName
}

@MemberwiseInit(.public)
public struct Description: Codable, Hashable {
    public let description: String
    public let language: LanguageName
}
