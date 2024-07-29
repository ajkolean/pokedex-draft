import ComposableArchitecture

import ItemListFeature
import LocationsListFeature
import Models
import PokemonDetailFeature
import PokemonListFeature
import PokemonRepo
import RegionListFeature
import SwiftUI
import TypeDetailFeature
import TypeListFeature

@Reducer
public struct AppFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public init() {}
        var path = StackState<Path.State>()
    }

    public enum Action: Sendable {
        case path(StackActionOf<Path>)
        case menuItemTapped(MenuItem)
    }

    @Reducer(state: .equatable, .sendable, action: .sendable)
    public enum Path {
        case pokemon(PokemonListFeature)
        case typeDetail(TypeDetailFeature)
        case typeList(TypeListFeature)
        case pokemonDetail(PokemonDetailFeature)
        case itemList(ItemListFeature)
        case regionList(RegionListFeature)
        case locationsList(LocationsListFeature)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case let .menuItemTapped(item):
                switch item {
                case .pokedex:
                    state.path.append(.pokemon(PokemonListFeature.State()))
                case .types:
                    state.path.append(.typeList(TypeListFeature.State()))
                case .items:
                    state.path.append(.itemList(ItemListFeature.State()))
                    return .none
                case .regions:
                    state.path.append(.regionList(RegionListFeature.State()))
                    return .none
                default:
                    return .none
                }
                return .none
            case let .path(.element(id: _, action: .typeList(.pokemonTypeTapped(pokemonType)))):
                state.path.append(.typeDetail(TypeDetailFeature.State(pokemonType: pokemonType)))
                return .none
            case let .path(.element(id: _, action: .typeDetail(.pokemonCardTapped(pokemon)))):
                state.path.append(.pokemonDetail(PokemonDetailFeature.State(pokemonSummary: pokemon)))
                return .none
            case let .path(.element(id: _, action: .pokemon(.pokemonCardTapped(pokemon)))):
                state.path.append(.pokemonDetail(PokemonDetailFeature.State(pokemonSummary: pokemon)))
                return .none
            case .path(.element(id: _, action: .itemList(.itemRowTapped))):
                return .none
            case .path(.element(id: _, action: .regionList(.regionTapped(let region)))):
                state.path.append(.locationsList(LocationsListFeature.State(regionID: region.id)))
                return .none
            case .path(.element(id: _, action: .locationsList(.locationAreaTapped(let area)))):
                state.path.append(.pokemon(PokemonListFeature.State(listLoadType: .locationArea(area))))
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

public struct AppView: View {
    @Bindable public var store: StoreOf<AppFeature>

    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack(
            path: $store.scope(state: \.path, action: \.path)
        ) {
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
                    .overlay(
                        ModelsAsset
                            .spinningball
                            .swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .opacity(0.2)
                            .frame(width: 250, height: 250)
                            .offset(x: 75, y: -125),
                        alignment: .topTrailing
                    )
                }
            }
        } destination: { store in
            switch store.case {
            case let .pokemon(store):
                PokemonListFeatureView(store: store)
            case let .typeList(store):
                TypeListFeatureView(store: store)
            case let .typeDetail(store):
                TypeDetailView(store: store)
            case let .pokemonDetail(store):
                PokemonDetailView(store: store)
            case let .itemList(store):
                ItemListFeatureView(store: store)
            case let .regionList(store):
                RegionListFeatureView(store: store)
            case let .locationsList(store):
                LocationsListFeatureView(store: store)
            }
        }
    }
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
