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
        public typealias Name = Identifier<String>
        public typealias ID = Identifier<String>
        
        public var id: ID { ID(rawValue: _id) }
        public var name: Name { Name(rawValue: _name) }

        public struct Image: Codable, Hashable, Sendable {
            public let symbol: URL
            public let logo: URL
        }

        private var _id: String
        public var _name: String
        
        public let series: String
        public let printedTotal: Int
        public let total: Int
        public let ptcgoCode: String?
        public let releaseDate: Date
        public let updatedAt: Date
        public let images: Image
        
        public init(id: ID, name: Name, series: String, printedTotal: Int, total: Int, ptcgoCode: String?, releaseDate: Date, updatedAt: Date, images: Image) {
            self._id = id.rawValue
            self._name = name.rawValue
            self.series = series
            self.printedTotal = printedTotal
            self.total = total
            self.ptcgoCode = ptcgoCode
            self.releaseDate = releaseDate
            self.updatedAt = updatedAt
            self.images = images
        }
        
        private enum CodingKeys: String, CodingKey {
            case _id = "id"
            case _name = "name"
            case series
            case printedTotal
            case total
            case ptcgoCode, releaseDate, updatedAt, images
        }
    }
}
