import Foundation

struct NamedAPIResourceListResponse: Codable {
    /// The total number of resources available from this API.
    let count: Int
    /// The URL for the next page in the list.
    let next: String?
    /// The URL for the previous page in the list.
    let previous: String?
    /// A list of named API resources.
    let results: [NamedAPIResource]
}

struct APIResourceListResponse: Codable {
    /// The total number of resources available from this API.
    let count: Int
    /// The URL for the next page in the list.
    let next: String?
    /// The URL for the previous page in the list.
    let previous: String?
    /// A list of unnamed API resources.
    let results: [APIResource]
}
