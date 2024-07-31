import Foundation

public enum TCG {}

extension TCG {
    public struct CardMarket: Codable, Hashable, Sendable {
        public let url: URL
        public let updatedAt: Date
        public let prices: CardMarketPrice?
    }

    public struct CardMarketPrice: Codable, Hashable, Sendable {
        public let averageSellPrice: Decimal
        public let lowPrice: Decimal
        public let trendPrice: Decimal
        public let germanProLow: Decimal
        public let suggestedPrice: Decimal
        public let reverseHoloSell: Decimal
        public let reverseHoloLow: Decimal
        public let reverseHoloTrend: Decimal
        public let lowPriceExPlus: Decimal
        public let avg1: Decimal
        public let avg7: Decimal
        public let avg30: Decimal
        public let reverseHoloAvg1: Decimal
        public let reverseHoloAvg7: Decimal
        public let reverseHoloAvg30: Decimal
    }
}
