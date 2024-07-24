import ComposableArchitecture
import PokemonListFeature
import SwiftUI
import Models

@Reducer
public struct AppFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
        @Presents var destination: Destination.State?
    }
    
    public enum Action {
        case destination(PresentationAction<Destination.Action>)
        case menuItemTapped(MenuItem)
    }
    
    @Reducer(state: .equatable)
    public enum Destination {
        case pokemon(PokemonListFeature)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .destination:
                return .none
            case let .menuItemTapped(item):
                switch item {
                case .pokedex:
                    state.destination = .pokemon(PokemonListFeature.State())
                default:
                    return .none
                }
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

public struct AppView: View {
    @Bindable public var store: StoreOf<AppFeature>

    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack {
            ZStack {
                pokemonRedBackground()
                    .clipShape(BottomRoundedRectangle(radius: 40))
                    .ignoresSafeArea()
                
                Color(UIColor.systemBackground).offset(y: 300)
                
                ScrollView {
                    VStack(spacing: 0) {
                        VStack {
                            // Top search bar section
                            VStack(alignment: .leading) {
                                Text("What Pokémon are you looking for?")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top, 40)
                                
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                    TextField("Search Pokemon, Move, Ability, etc", text: .constant(""))
                                        .textFieldStyle(PlainTextFieldStyle())
                                }
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(25)
                            }
                            .padding()
                            .background(pokemonRedBackground())
                            .clipShape(BottomRoundedRectangle(radius: 40))
                            .padding(.bottom, 20)
                            
                            // Middle buttons section
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                                ForEach(MenuItem.allCases, id: \.self) { item in
                                    MenuCardView(item: item).onTapGesture {
                                        store.send(.menuItemTapped(item))
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .background(Color(UIColor.systemBackground))
                }
            }
            .sheet(
                item: $store.scope(state: \.destination?.pokemon, action: \.destination.pokemon)
            ) { store in
                NavigationStack {
                    PokemonListFeatureView(store: store)
                }
            }
        }
    }
 
//        PokemonListFeatureView(store: store.scope(state: \.pokemonListFeature, action: \.pokemonListFeature))
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}

func pokemonRedBackground() -> Color {
    return Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(red: 0.83, green: 0.33, blue: 0.29, alpha: 1.0)
        } else {
            return UIColor(red: 0.91, green: 0.45, blue: 0.39, alpha: 1.0)
        }
    })
}
