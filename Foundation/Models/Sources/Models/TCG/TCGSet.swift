import Foundation

extension TCG {
    public struct Set: Codable, Hashable, Sendable, Identifiable  {
        public typealias Name = Identifier<String>
        public typealias ID = Identifier<Int>
        
        public struct Image: Codable, Hashable, Sendable  {
            public let symbol: URL
            public let logo: URL
        }
        
        public let id: ID
        public let name: Name
        public let series: String
        public let printedTotal: Int
        public let total: Int
        public let ptcgoCode: String
        public let releaseDate: Date
        public let updatedAt: Date
        public let images: Image
    }
}
