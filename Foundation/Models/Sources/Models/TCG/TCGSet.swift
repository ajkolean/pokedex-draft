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
        public struct Name: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
            public let rawValue: String
            
            public init(rawValue: String) {
                self.rawValue = rawValue
            }
        }
        
        public struct ID: Codable, IdentifierProtocol, ExpressibleByStringLiteral {
            public let rawValue: String
            
            public init(rawValue: String) {
                self.rawValue = rawValue
            }
        }

        public struct Image: Codable, Hashable, Sendable {
            public let symbol: URL
            public let logo: URL
        }

        public let id: ID
        public let name: Name
        public let series: String
        public let printedTotal: Int
        public let total: Int
        public let ptcgoCode: String?
        public let releaseDate: Date
        public let updatedAt: Date
        public let images: Image
    }
}
