import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import SwiftUI

@Reducer
public struct TCGCardDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var card: TCG.Card
        public var allCards: IdentifiedArrayOf<TCG.Card> = []
        public var isCardFlipped = false
        public var flipAnimationComplete = false
        public var rotationAngle: Double = 0

        public init(card: TCG.Card) {
            self.card = card
            self.allCards = [card]
        }
    }

    public enum Action: Equatable, Sendable, BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case setPokemonCards([TCG.Card])
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                state.rotationAngle += 180
                state.isCardFlipped.toggle()
                return .run { [card = state.card] send in
                    let a = try await pokemonRepo.fetchCardsByPokemonName(card.cardName)
                    await send(.setPokemonCards(a), animation: .easeInOut)
                }

            case let .setPokemonCards(cards):
  
                let c = cards.filter { $0.id != state.card.id}
                state.allCards = IdentifiedArray(uniqueElements: ([state.card] + c))
                return .none
            case .binding:
                return .none
            }
        }
    }
}

public struct TCGCardDetailView: View {
    @Bindable public var store: StoreOf<TCGCardDetailFeature>
    @Namespace private var animation

    public init(store: StoreOf<TCGCardDetailFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .center) {
                    ModelsAsset
                        .pokemonCardBack
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .shadow(color: .gray, radius: 10)
                        .cardStyle()
                        .opacity(store.isCardFlipped ? 0 : 1)

                    ImageCarouselView(
                        items: $store.allCards,
                        selectedItem: $store.card
                    ) { selectedCard in

                        KFImage(selectedCard.images.large)
                            .resizable()
                            .scaledToFit()
                            .shadow(color: .gray, radius: 10)
                            .cardStyle()
                            .opacity(store.isCardFlipped ? 1 : 0)
                    
                    }
                    .rotation3DEffect(
                        Angle(degrees: 180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                }

                .rotation3DEffect(
                    Angle(degrees: store.rotationAngle),
                    axis: (x: 0, y: 1, z: 0)
                )
            }

            Group {
                if !store.allCards.isEmpty {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(store.allCards) { card in
                            KFImage(card.images.small)
                                .resizable()
                                .scaledToFit()
                                .cardStyle()
                        }
                    }
                }
            }
            .padding()
        }

        .onAppear {
            store.send(.onAppear, animation: Animation.easeInOut(duration: 1))
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
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
    }
}

extension View {
    func cardStyle() -> some View {
        self.modifier(CardModifier())
    }
}
