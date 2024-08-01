import Foundation
import Models

// Define the TCGNetworkClient
public class TCGAPIService {
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategyFormatters = [DateFormatter.yearMonthDay, DateFormatter.yearMonthDayTime]
        return decoder
    }()

    private let baseURL = "https://api.pokemontcg.io/v2/"
    private let apiKey: String?
    private let session: URLSession

    public init(
        apiKey: String? = ProcessInfo.processInfo.environment["TCG_API_KEY"],
        session: URLSession = .shared
    ) {
        self.apiKey = apiKey
        self.session = session
    }

    // Function to fetch all sets
    public func fetchAllTCGSets() async throws -> TCG.SetList {
        return try await fetchData(endpoint: .sets, decodeType: TCG.SetList.self)
    }

    // Function to fetch cards by set name
    public func fetchTCGCardsBySetID(_ id: TCG.SetID) async throws -> TCG.CardList {
        try await fetchTCGCardsByForQuery(queryItems: [.setID(id: id)])
    }

    // Function to fetch cards by Pokémon name
    func fetchCardsByPokemonName(_ pokemonName: TCG.CardName) async throws -> TCG.CardList {
        try await fetchTCGCardsByForQuery(queryItems: [.name(name: pokemonName)])
    }

    // MARK: - Helpers

    public func fetchTCGCardsByForQuery(
        queryItems: [TCGCardQueryComponent] = [],
        page: Int = 1,
        pageSize: Int = 250
    ) async throws -> TCG.CardList {
        let endpoint = TCGEndpoint.cards(queryItems)

        var results = try await fetchData(endpoint: endpoint, decodeType: TCG.CardList.self)
        var page = results.page
        while results.cards.count < results.totalCount || results.count == 250 {
            let nextPage = try await fetchTCGCardsByForQuery(queryItems: queryItems, page: page)
            page += 1
            results.cards.append(contentsOf: nextPage.cards)
        }

        return results
    }

    private func createRequest(
        endpoint: TCGEndpoint,
        page: Int = 1,
        pageSize: Int = 250
    ) throws -> URLRequest {
        let urlComponents = endpoint.urlComponents(baseURL: baseURL, page: page, pageSize: pageSize)
        guard let url = urlComponents?.url else {
            throw TCGNetworkError.invalidURL(endpoint: endpoint)
        }
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        let apiHeader = request.allHTTPHeaderFields?["X-Api-Key"]
        if apiHeader.isNilOrEmpty {
            print("No TCG_API_KEY SET")
        }
        return request
    }

    // Helper function to perform data task and decode response
    private func fetchData<T: Codable>(
        endpoint: TCGEndpoint,
        decodeType: T.Type
    ) async throws -> T {
        let request = try createRequest(endpoint: endpoint)
 
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw TCGNetworkError.noData(endpoint: endpoint)
        }

        guard let httpResponse = response as? HTTPURLResponse,
              (200 ... 299).contains(httpResponse.statusCode)
        else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw TCGNetworkError.badServerResponse(endpoint: endpoint, statusCode: statusCode)
        }

        do {
            return try jsonDecoder.decode(decodeType, from: data)
        } catch let error as DecodingError {
            if case let .dataCorrupted(context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Corrupted data: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            } else if case let .keyNotFound(_, context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data with missing key: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            } else if case let .typeMismatch(_, context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data with type mismatch: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            } else if case let .valueNotFound(_, context) = error {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data with missing value: \(dataString)")
                }
                throw TCGNetworkError.decodingError(endpoint: endpoint, context: context)
            }
            throw error
        }
    }
}
