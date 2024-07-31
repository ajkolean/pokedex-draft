import Foundation
import Models

// Define the TCGNetworkClient
public class TCGNetworkClient {
    // Base URL for the Pokémon TCG API
    private let baseURL = "https://api.pokemontcg.io/v2"
    
    // API Key fetched from the environment
    private let apiKey: String?
    
    // Shared URLSession instance
    private let session: URLSession
    
    // Initialize the client with the API key and URLSession
    public init(
        apiKey: String? = ProcessInfo.processInfo.environment["TCG_API_KEY"],
        session: URLSession = .shared
    ) {
        if apiKey == nil { print("No TCG_API_KEY SET")}
        self.apiKey = apiKey
        self.session = session
    }
    
    // Function to fetch all sets
    public func fetchAllSets() async throws -> TCG.SetList {
        return try await fetchData(endpoint: "/sets", decodeType: TCG.SetList.self)
    }
    
    // Function to fetch cards by set name
    public func fetchCardsBySetName(_ setName: TCG.Set.Name) async throws -> TCG.CardList {
        let queryItem = URLQueryItem(name: "q", value: "!set.name:\(setName)")
        return try await fetchData(endpoint: "/cards", queryItems: [queryItem], decodeType: TCG.CardList.self)
    }
    
    // Function to fetch cards by Pokémon name
    func fetchCardsByPokemonName(_ pokemonName: TCG.Card.Name) async throws -> TCG.CardList {
        let queryItem = URLQueryItem(name: "q", value: "!name:\(pokemonName)")
        return try await fetchData(endpoint: "/cards", queryItems: [queryItem], decodeType: TCG.CardList.self)
    }
    
    // MARK: - Helpers
    
    private func createRequest(
        endpoint: String,
        queryItems: [URLQueryItem]? = nil
    ) throws -> URLRequest {
        var urlComponents = URLComponents(string: baseURL + endpoint)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else {
            throw TCGNetworkError.invalidURL(endpoint: endpoint)
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        return request
    }
    
    // Helper function to perform data task and decode response
    private func fetchData<T: Codable>(
        endpoint: String,
        queryItems: [URLQueryItem]? = nil,
        decodeType: T.Type
    ) async throws -> T {
        let request = try createRequest(endpoint: endpoint, queryItems: queryItems)
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw TCGNetworkError.noData(endpoint: endpoint)
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200 ... 299).contains(httpResponse.statusCode) else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw TCGNetworkError.badServerResponse(endpoint: endpoint, statusCode: statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "yyyy/MM/dd"
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "yyyy/MM/dd HH:mm:ss"
            decoder.dateDecodingStrategyFormatters = [dateFormatter1, dateFormatter2]
            
            return try decoder.decode(decodeType, from: data)
        } catch let error as DecodingError {
            if case .dataCorrupted(let context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Corrupted data: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            } else if case .keyNotFound(_, let context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data with missing key: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            } else if case .typeMismatch(_, let context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data with type mismatch: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            } else if case .valueNotFound(_, let context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data with missing value: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            }
            throw error
        }
    }
}

