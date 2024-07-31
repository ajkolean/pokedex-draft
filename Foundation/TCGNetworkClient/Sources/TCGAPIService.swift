import Foundation
import Models

// Define the TCGNetworkClient
public class TCGAPIService {
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategyFormatters = [DateFormatter.yearMonthDay, DateFormatter.yearMonthDayTime]
        return decoder
    }()

    private let baseURL = "https://api.pokemontcg.io/v2"
    private let apiKey: String?
    private let session: URLSession
    
    public init(
        apiKey: String? = ProcessInfo.processInfo.environment["TCG_API_KEY"],
        session: URLSession = .shared
    ) {
        if apiKey == nil { print("No TCG_API_KEY SET")}
        self.apiKey = apiKey
        self.session = session
    }
    
    // Function to fetch all sets
    public func fetchAllTCGSets() async throws -> TCG.SetList {
        return try await fetchData(endpoint: "/sets", decodeType: TCG.SetList.self)
    }
    
    // Function to fetch cards by set name
    public func fetchTCGCardsBySetName(_ setName: TCG.Set.Name) async throws -> TCG.CardList {
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
            return try jsonDecoder.decode(decodeType, from: data)
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

