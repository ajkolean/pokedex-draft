import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import SwiftUI

@Reducer
public struct TCGCardListFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var cards: IdentifiedArrayOf<TCG.Card> = []
        public let set: TCG.Set

        public init(set: TCG.Set) {
            self.set = set
        }
    }

    public enum Action: Equatable, Sendable {
        case fetchTCGCards
        case setTCGCards(Result<[TCG.Card], EquatableError>)
        case tcgCardTapped(TCG.Card)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .fetchTCGCards:
                return .run { [pokemonRepo = self.pokemonRepo, cardSet = state.set] send in
                    do {
                        let cards = try await pokemonRepo.fetchTCGCardsBySetName(setName: cardSet.name)
                        await send(.setTCGCards(.success(cards)))
                    } catch {
                        await send(.setTCGCards(.failure(EquatableError(error))))
                    }
                }
            case let .setTCGCards(.success(cards)):
                state.cards = .init(uniqueElements: cards)
                return .none

            case let .setTCGCards(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error.localizedDescription)")
            case .tcgCardTapped:
                return .none
            }
        }
    }
}

public struct TCGCardListFeatureView: View {
    @Bindable public var store: StoreOf<TCGCardListFeature>
    private let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    public init(store: StoreOf<TCGCardListFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                ForEach(store.cards) { card in
                    KFImage(card.images.large)
                        .resizable()
                        .scaledToFit()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .shadow(color: Color.gray, radius: 4, x: 1.0, y: 1.0)
                        .tappable {
                            store.send(.tcgCardTapped(card))
                        }
                }
            }
            .padding()
            .navigationTitle("\(store.set.name.rawValue) Set")
            .onAppear {
                store.send(.fetchTCGCards)
            }
        }
    }
}
