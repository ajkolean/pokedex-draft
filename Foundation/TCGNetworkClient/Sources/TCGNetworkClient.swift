import Foundation
import Models

// Define the TCGNetworkClient
class TCGNetworkClient {
    // Base URL for the Pokémon TCG API
    private let baseURL = "https://api.pokemontcg.io/v2"

    // API Key fetched from the environment
    private let apiKey: String

    // Shared URLSession instance
    private let session: URLSession

    // Initialize the client with the API key and URLSession
    init(apiKey: String, session: URLSession = .shared) {
        self.apiKey = apiKey
        self.session = session
    }

    // Function to create the URLRequest
    private func createRequest(endpoint: String, queryItems: [URLQueryItem]? = nil) -> URLRequest? {
        var urlComponents = URLComponents(string: baseURL + endpoint)
        urlComponents?.queryItems = queryItems

        guard let url = urlComponents?.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        return request
    }

    // Helper function to perform data task and decode response
    private func fetchData<T: Codable>(
        endpoint: String,
        queryItems: [URLQueryItem]? = nil,
        decodeType: TCGResponse<T>.Type
    ) async throws -> TCGResponse<T> {
        guard let request = createRequest(endpoint: endpoint, queryItems: queryItems) else {
            throw TCGNetworkError.invalidURL(endpoint: endpoint)
        }

        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw TCGNetworkError.noData(endpoint: endpoint)
        }

        guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw TCGNetworkError.badServerResponse(endpoint: endpoint, statusCode: statusCode)
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(decodeType, from: data)
        } catch {
            throw TCGNetworkError.decodingError(endpoint: endpoint, error: error)
        }
    }

    // Function to fetch all sets
    func fetchAllSets() async throws -> TCGResponse<TCGSet> {
        return try await fetchData(endpoint: "/sets", decodeType: TCGResponse<TCGSet>.self)
    }

    // Function to fetch cards by set name
    func fetchCardsBySetName(_ setName: String) async throws -> TCGResponse<TCGCard> {
        let queryItem = URLQueryItem(name: "q", value: "!set.name:\(setName)")
        return try await fetchData(endpoint: "/cards", queryItems: [queryItem], decodeType: TCGResponse<TCGCard>.self)
    }

    // Function to fetch cards by Pokémon name
    func fetchCardsByPokemonName(_ pokemonName: String) async throws -> TCGResponse<TCGCard> {
        let queryItem = URLQueryItem(name: "q", value: "!name:\(pokemonName)")
        return try await fetchData(endpoint: "/cards", queryItems: [queryItem], decodeType: TCGResponse<TCGCard>.self)
    }
}

// Define the generic response model
struct TCGResponse<T: Codable>: Codable {
    let data: [T]
    let page: Int
    let pageSize: Int
    let count: Int
    let totalCount: Int
}
