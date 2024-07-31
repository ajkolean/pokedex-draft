import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import SwiftUI

@Reducer
public struct TCGCardDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public let card: TCG.Card
        public var allCards: IdentifiedArrayOf<TCG.Card> = []
        public var isCardFlipped = false
        public var rotationAngle: Double = 0
        
        public init(card: TCG.Card) {
            self.card = card
        }
    }
    
    public enum Action: Equatable, Sendable {
        case onAppear
        case setPokemonCards([TCG.Card])
    }
    
    @Dependency(\.pokemonRepo) var pokemonRepo
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                state.rotationAngle += 180
                state.isCardFlipped.toggle()
                return .run { [card = state.card] send in
                    let a = try await pokemonRepo.fetchCardsByPokemonName(pokemonName: card.name)
                    await send(.setPokemonCards(a), animation: .default)
                }
                
            case .setPokemonCards(let cards):
                state.allCards = .init(uniqueElements: cards)
                return .none
            }
        }
    }
}

public struct TCGCardDetailView: View {
    @Bindable public var store: StoreOf<TCGCardDetailFeature>
    
    public init(store: StoreOf<TCGCardDetailFeature>) {
        self.store = store
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    ModelsAsset
                        .pokemonCardBack
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .shadow(color: .gray, radius: 10)
                        .opacity(store.isCardFlipped ? 0 : 1)
                    
                    KFImage(store.card.images.large)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .shadow(color: .gray, radius: 10)
                        .opacity(store.isCardFlipped ? 1 : 0)
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
                    
                }
            }
            
        }
        .padding()
        
        .onAppear {
            store.send(.onAppear, animation: Animation.easeInOut(duration: 1))
        }
        
    }
    
}

