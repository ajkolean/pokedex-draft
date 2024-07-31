import Foundation

extension TCG {
    public struct Player: Codable, Hashable, Sendable {
        public enum PriceType: String, Codable, Hashable, Sendable  {
            case normal = "normal"
            case holofoil = "holofoil"
            case reverseHolofoil = "reverseHolofoil"
            case firstEditionHolofoil = "1stEditionHolofoil"
            case firstEditionNormal = "1stEditionNormal"
        }
        
        public struct Price: Codable, Hashable, Sendable {
            public let low: Decimal
            public let mid: Decimal
            public let high: Decimal
            public let market: Decimal
            public let directLow: Decimal
        }
        
        public let url: URL
        public let updatedAt: Date
        public let prices: [PriceType: Price]
    }
}
