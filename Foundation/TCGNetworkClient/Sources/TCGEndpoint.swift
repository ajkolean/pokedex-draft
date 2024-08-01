import Foundation
import Models

public enum TCGEndpoint {
    case sets([TCGSetQueryComponent])
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
        case let .sets(array):
            array.queryString
        case let .cards(array):
            array.queryString
        }

        var queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
        ]

        guard let query else { return queryItems }
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
        case let .name(name):
            "!name:\"\(name.rawValue)\""
        case let .setID(setID):
            "!set.id:\"\(setID.rawValue)\""
        }
    }
}

extension [TCGCardQueryComponent] {
    public var queryString: String {
        map(\.value).sorted { $0 < $1 }.joined(separator: " ")
    }
}

public enum TCGSetQueryComponent {
    case name(name: TCG.SetName)

    public var value: String {
        switch self {
        case let .name(name):
            "!name:\"\(name.rawValue)\""
        }
    }
}

extension [TCGSetQueryComponent] {
    public var queryString: String {
        self.map(\.value).sorted { $0 < $1 }.joined(separator: " ")
    }
}
