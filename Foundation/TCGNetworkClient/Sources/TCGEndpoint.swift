import Foundation
import Models

public enum TCGEndpoint {
    case sets
    case cards([TCGCardQueryComponent])
    
    var path: String {
        switch self {
        case .sets:
            "sets"
        case .cards:
            "cards"
        }
    }
    
    func searchQueryItems(page: Int = 1, pageSize: Int = 250) -> [URLQueryItem] {
        let query: String? = switch self {
        case .sets:
            nil
        case .cards(let array):
            array.queryString
        }
        
        var queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
        ]
        
        guard let query else { return queryItems}
        queryItems.insert(URLQueryItem(name: "q", value: query), at: 0)
        return queryItems
    }
    
    func urlComponents(baseURL: String, page: Int = 1, pageSize: Int = 250) -> URLComponents? {
        var urlComponents = URLComponents(string: baseURL + path)
        urlComponents?.queryItems = searchQueryItems(page: page, pageSize: pageSize)
        return urlComponents
    }
}

public enum TCGCardQueryComponent {
    case name(name: TCG.CardName)
    case setID(id: TCG.SetID)
    
    public var value: String {
        switch self {
        case .name(let name):
            "!name:\"\(name.rawValue)\""
        case .setID(let setID):
            "!set.id:\"\(setID.rawValue)\""
        }
    }
}

extension [TCGCardQueryComponent] {
    public var queryString: String {
        self.map { $0.value }.sorted { $0 < $1 }.joined(separator: " ")
    }
}

public struct SearhQuery {
    public var endpoint: TCGEndpoint
    public var queryItems: [TCGEndpoint]
    public var queryDate: Date
}
