import Foundation

enum TCGNetworkError: Error {
    case invalidURL(endpoint: String)
    case badServerResponse(endpoint: String, statusCode: Int)
    case noData(endpoint: String)
    case decodingError(endpoint: String, context: DecodingError.Context)

    var localizedDescription: String {
        switch self {
        case let .invalidURL(endpoint):
            return "Invalid URL for endpoint: \(endpoint)"
        case let .badServerResponse(endpoint, statusCode):
            return "Bad server response for endpoint: \(endpoint), status code: \(statusCode)"
        case let .noData(endpoint):
            return "No data received for endpoint: \(endpoint)"
        case let .decodingError(endpoint, context):
            return """
            Decoding error for endpoint: \(endpoint)
            Debug description: \(context.debugDescription)
            Coding path: \(context.codingPath)
            """
        }
    }
}
