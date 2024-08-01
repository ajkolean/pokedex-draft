import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import SwiftUI

@Reducer
public struct TCGCardDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var placeholder: TCG.Card {
            var placeholder = card
            placeholder.id = UUID().uuidString
            return placeholder
        }
        
        public var card: TCG.Card
        public var hiddenCards: IdentifiedArrayOf<TCG.Card> = []
        
        public var allCards: IdentifiedArrayOf<TCG.Card> = []
        public var isCardFlipped = false
        public var flipAnimationComplete = false
        public var rotationAngle: Double = 0
        
        public init(card: TCG.Card) {
            self.card = card
            allCards = [card]
        }
    }
    
    public enum Action: Equatable, Sendable, BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case setPokemonCards([TCG.Card])
        case setVisiblePokemonCards
    }
    
    @Dependency(\.pokemonRepo) var pokemonRepo
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                state.isCardFlipped = true
                state.rotationAngle += 180
                return .run { [card = state.card] send in
                    let a = try await pokemonRepo.fetchCardsByPokemonName(card.cardName)
                    await send(.setPokemonCards(a), animation: .easeInOut)
                }
                
            case let .setPokemonCards(cards):
                
                let c = cards.filter { $0.id != state.card.id }
                let hiddenCards = IdentifiedArray(uniqueElements: [state.card] + c)
                if state.flipAnimationComplete {
                    state.hiddenCards = hiddenCards
                    state.allCards = hiddenCards
                } else {
                    state.hiddenCards = hiddenCards
                }
                
                return .none
            case .setVisiblePokemonCards:
                state.flipAnimationComplete = true
                state.allCards = state.hiddenCards
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
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [PokemonTypeEnum.psychic.color(), Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            Color(UIColor.systemBackground).offset(y: 500)
            
            ScrollView {
                carouselView

                VStack {
                    HStack { Spacer() }
                        .padding(.top, 75)
                    
                    ModelsAsset
                        .pokemonCardBack
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    
                    ModelsAsset
                        .pokemonCardBack
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    
                
                }
                .background(Color(UIColor.systemBackground))
                .cornerRadius(40)
                .padding(.top, -40)
                .zIndex(-1)
            }

            .onAppear {
                var animation = Transaction(animation: Animation.easeInOut(duration: 1))
                animation.addAnimationCompletion {
                    store.send(.setVisiblePokemonCards, animation: .easeInOut)
                }
                store.send(.onAppear, transaction: animation)
            }
            .navigationTitle(store.card.cardName.rawValue)
        }

    }
    
    @ViewBuilder
    var carouselView: some View {
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
                .disabled(!store.flipAnimationComplete)
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 0, y: 1, z: 0)
                )
            }
            
            .rotation3DEffect(
                Angle(degrees: store.rotationAngle),
                axis: (x: 0, y: 1, z: 0)
            )
            .background(carouselPlaceholderView)
        }
        
    }
    
    var carouselPlaceholderView: some View {
        ImageCarouselView(
            items: .constant([store.card, store.placeholder]),
            selectedItem: .constant(store.card)
        ) { selectedCard in
            
            if selectedCard == store.card {
                ModelsAsset
                    .pokemonCardBack
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .hidden()
                
            } else {
                ModelsAsset
                    .pokemonCardBack
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .cardStyle()
                    .blur(radius: 20)
            }
        }
        .disabled(true)
        .opacity(store.flipAnimationComplete ? 0 : 1)
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
        modifier(CardModifier())
    }
}
