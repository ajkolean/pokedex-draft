import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private let baseURL = "https://pokeapi.co/api/v2/"

    private init() {}

    func fetch<T: Decodable>(_: T.Type, endpoint: Endpoint, identifier: some IdentifierProtocol) async throws -> T {
        let urlString = "\(baseURL)\(endpoint.rawValue)/\(identifier.rawValue)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    func fetchList<T: Decodable>(_: T.Type, endpoint: Endpoint, limit: Int = 20, offset: Int = 0) async throws -> T {
        let urlString = "\(baseURL)\(endpoint.rawValue)?limit=\(limit)&offset=\(offset)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
