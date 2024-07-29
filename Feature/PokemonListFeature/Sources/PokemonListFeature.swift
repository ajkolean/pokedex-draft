// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonListFeature.swift
import ComposableArchitecture
import Models
import PokemonRepo
import SwiftUI

@Reducer
public struct PokemonListFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var pokemonIdentifiers: IdentifiedArrayOf<Pokemon> = []
        public var searchText: String = ""
        public var isLoading = true

        var filteredPokemons: [Pokemon] {
            var filteredList: [Pokemon] = []

            for pokemon in pokemonIdentifiers {
                if pokemon.name.rawValue.contains(searchText.lowercased()) {
                    filteredList.append(pokemon)
                } else if searchText == "\(pokemon.id)" {
                    filteredList.append(pokemon)
                }
            }

            return searchText == "" ? pokemonIdentifiers.elements : filteredList
        }

        public init() {}
    }

    public enum Action: BindableAction, Equatable, Sendable {
        case binding(BindingAction<State>)
        case fetchPokemonIdentifiers
        case setPokemonList(Result<[Pokemon], NSError>)
        case pokemonCardTapped(Pokemon)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .binding:
                return .none
            case .fetchPokemonIdentifiers:
                return .run { [client = pokemonRepo] send in
                    do {
                        let pokemon = try await client.fetchPokemonList()
                        await send(.setPokemonList(.success(pokemon)))
                    } catch {
                        await send(.setPokemonList(.failure(error as NSError)))
                    }
                }
            case let .setPokemonList(.success(pokemonIdentifiers)):
                state.isLoading = false
                state.pokemonIdentifiers = .init(uniqueElements: pokemonIdentifiers)
                return .none

            case let .setPokemonList(.failure(error)):
                print("Failed to fetch pokemon list: \(error)")
                return .none
            case .pokemonCardTapped:
                return .none
            }
        }
    }
}

public struct PokemonListFeatureView: View {
    @Bindable public var store: StoreOf<PokemonListFeature>
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    public init(store: StoreOf<PokemonListFeature>) {
        self.store = store
    }

    public var body: some View {
        
        ZStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(store.filteredPokemons) { pokemon in
                        PokemonCardView(pokemon: pokemon)
                            .onTapGesture { // tappable
                                store.send(.pokemonCardTapped(pokemon))
                            }
                            .transition(.scale.combined(with: .opacity))
                    }
                }
            }

            if store.isLoading {
                LoadingOverlayView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .searchable(text: $store.searchText)
        .navigationTitle("Pokédex")
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                store.send(.fetchPokemonIdentifiers)
            }
        }
        .animation(.easeInOut, value: store.filteredPokemons)
    }
}

#Preview {
    PokemonListFeatureView(
        store: Store(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        }
    )
}
