import ComposableArchitecture
import Foundation
import Models
import PokemonAPIClientInterface

extension PokemonAPIClient: DependencyKey {
    private static let baseURL = "https://pokeapi.co/api/v2/"

    public static let liveValue: PokemonAPIClient = {
        let client = PokemonAPIClient(
            fetchPokemonIdentifiers: {
                let url = URL(string: "\(baseURL)pokemon?offset=0&limit=1302")!
                return try await fetchAndDecode(from: url, as: NameListResponse.self).results.map { basic in
                    let id = try extractID(from: basic.url)
                    return PokemonIdentifier(id: id, name: basic.name, url: basic.url)
                }
            },
            fetchPokemonDetails: { name in
                let url = URL(string: "\(baseURL)pokemon/\(name)")!
                return try await fetchAndDecode(from: url, as: PokemonDetails.self)
            },
            fetchPokemonSpecies: { url in
                return try await fetchAndDecode(from: url, as: PokemonSpecies.self)
            },
            fetchPokemon: { name in
                let details = try await Self.liveValue.fetchPokemonDetails(name)
                let species = try await Self.liveValue.fetchPokemonSpecies(details.species.url)
                return Pokemon(details: details, species: species)
            }, 
            fetchTypeIdentifiers: {
                let url = URL(string: "\(baseURL)type?offset=0&limit=50")!
                return try await fetchAndDecode(from: url, as: NameListResponse.self).results.map { basic in
                    let id = try extractID(from: basic.url)
                    return TypeIdentifier(id: id, name: basic.name, url: basic.url)
                }
            }, 
            fetchTypeDetails: { typeName in
                let url = URL(string: "\(baseURL)type/\(typeName)")!
                do {
                    return try await fetchAndDecode(from: url, as: PokemonTypeResponse.self)
                } catch {
                    fatalError(error.localizedDescription)
                }
                
            }
        )
        return client
    }()

    private static func extractID(from url: URL) throws -> Int {
        let components = url.pathComponents
        guard let idString = components.last, let id = Int(idString) else {
            throw CustomError.invalidIDFormat(idString: url.path)
        }

        return id
    }

    private static func fetchAndDecode<T: Decodable>(from url: URL, as _: T.Type) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let message = String(data: data, encoding: .utf8) ?? "Unknown error"
                throw CustomError.httpError(statusCode: httpResponse.statusCode, message: "\(message)\(url.absoluteString)")
            }

            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                let rawResponse = String(data: data, encoding: .utf8) ?? "Unable to convert data to string"
                print("Failed to decode JSON. Raw response: \(rawResponse)")
                throw CustomError.decodingError(message: "Failed to decode JSON: \(error.localizedDescription)")
            }
        } catch {
            print("Network error: \(error)")
            throw CustomError.networkError(error: error)
        }
    }
}

enum CustomError: Error, LocalizedError {
    case invalidURLFormat(url: String)
    case invalidIDFormat(idString: String)
    case httpError(statusCode: Int, message: String)
    case decodingError(message: String)
    case networkError(error: Error)

    var errorDescription: String? {
        switch self {
        case let .invalidURLFormat(url):
            return "Invalid URL format: \(url)"
        case let .invalidIDFormat(idString):
            return "Invalid ID format: \(idString)"
        case let .httpError(statusCode, message):
            return "HTTP error \(statusCode): \(message)"
        case let .decodingError(message):
            return message
        case let .networkError(error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

