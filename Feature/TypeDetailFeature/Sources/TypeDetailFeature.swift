import ComposableArchitecture
import Kingfisher
import PokemonRepo
import SwiftUI
import Models

@Reducer
public struct TypeDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public let pokemonType: PokemonType

        public init(pokemonType: PokemonType) {
            self.pokemonType = pokemonType
        }
    }

    public enum Action: Equatable {
        case onAppear
        case pokemonCardTapped(Pokemon)
    }

    @Dependency(\.pokemonAPIClient) var pokemonAPIClient

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { _, action in
            switch action {
            case .onAppear:
                return .none
            case .pokemonCardTapped:
                return .none
            }
        }
    }
}

public struct TypeDetailView: View {
    @Bindable public var store: StoreOf<TypeDetailFeature>

    public init(store: StoreOf<TypeDetailFeature>) {
        self.store = store
    }

    public var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [store.pokemonType.type.color(), Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Color(UIColor.systemBackground).offset(y: 300)

            ScrollView {
                store
                    .pokemonType
                    .type
                    .pokemonImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)

                VStack {
                    HStack(alignment: .center) {
                        store.pokemonType.type.icon
                            .resizable()
                            .renderingMode(.template)
                            .opacity(0.5)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .frame(width: 50, height: 50)
                        Text(store.pokemonType.type.rawValue.uppercased())
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color(UIColor.systemBackground))
                    }
                    .padding()
                    .background(store.pokemonType.type.color())
                    .cornerRadius(20)
                    .shadow(color: store.pokemonType.type.color(), radius: 4, x: 1.0, y: 1.0)
                    .padding(.top, 75)

                    DamageRelationsStackView(pokemonType: store.pokemonType)
                        .padding(.top, 24)

                    Text("Pokemon")
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(store.pokemonType.type.color().opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(color: store.pokemonType.type.color(), radius: 4, x: 1.0, y: 1.0)
                        .padding(.bottom, 24)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(store.pokemonType.pokemonByTypeSlot.map(\.pokemon)) { pokemon in

                            PokemonCardView(pokemon: pokemon)
                                .tappable {
                                    store.send(.pokemonCardTapped(pokemon))
                                }
                        }
                    }
                }

                .background(Color(UIColor.systemBackground))
                .cornerRadius(40)
                .padding(.top, -40)
                .zIndex(-1)
            }
        }

        .onAppear {
            store.send(.onAppear)
        }
    }
}
