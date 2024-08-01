import Foundation

extension TCG {
    public struct SetList: Hashable, Codable, Sendable {
        public let sets: [Set]
        public let page: Int
        public let pageSize: Int
        public let count: Int
        public let totalCount: Int

        private enum CodingKeys: String, CodingKey {
            case sets = "data"
            case page
            case pageSize
            case count
            case totalCount
        }
    }

    public struct Set: Codable, Hashable, Sendable, Identifiable {
        public struct Image: Codable, Hashable, Sendable {
            public let symbol: URL
            public let logo: URL
        }
        
        public var setName: SetName { .init(rawValue: name) }
        public var setID: SetID { .init(rawValue: id) }

        public let id: String
        public let name: String

        public let series: String
        public let printedTotal: Int
        public let total: Int
        public let ptcgoCode: String?
        public let releaseDate: Date
        public let updatedAt: Date
        public let images: Image

        public init(
            id: String,
            name: String,
            series: String,
            printedTotal: Int,
            total: Int,
            ptcgoCode: String?,
            releaseDate: Date,
            updatedAt: Date,
            images: Image
        ) {
            self.id = id
            self.name = name
            self.series = series
            self.printedTotal = printedTotal
            self.total = total
            self.ptcgoCode = ptcgoCode
            self.releaseDate = releaseDate
            self.updatedAt = updatedAt
            self.images = images
        }
    }
}

extension TCG {
    public struct SetName: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    
    // MARK: - PokemonID
    
    public struct SetID: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
}
