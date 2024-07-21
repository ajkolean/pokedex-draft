// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonListFeature.swift
import ComposableArchitecture
import Models
import PokemonAPIClient
import PokemonAPIClientInterface
import SwiftUI

@Reducer
public struct PokemonListFeature {
    @ObservableState
    public struct State: Equatable {
        public var pokemons: IdentifiedArrayOf<PokemonShort> = []
        public var searchText: String = ""

        var filteredPokemons: [PokemonShort] {
            var filteredList: [PokemonShort] = []

            for pokemon in pokemons {
                if pokemon.name.contains(searchText.lowercased()) {
                    filteredList.append(pokemon)
                } else if searchText == "\(pokemon.id)" {
                    filteredList.append(pokemon)
                }
            }

            return searchText == "" ? pokemons.elements : filteredList
        }

        public init() {}
    }

    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case fetchPokemonList
        case setPokemonList(Result<[PokemonShort], Error>)
    }

    @Dependency(\.pokemonAPIClient) var pokemonAPIClient

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .fetchPokemonList:
                return .run { send in
                    do {
                        let pokemon = try await pokemonAPIClient.fetchPokemonList()
                        await send(.setPokemonList(.success(pokemon)))
                    } catch {
                        await send(.setPokemonList(.failure(error)))
                    }
                }
            case let .setPokemonList(.success(pokemons)):
                state.pokemons = .init(uniqueElements: pokemons)
                return .none

            case let .setPokemonList(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error)")
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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(store.filteredPokemons) { pokemon in
                        PokemonCardView(pokemon: pokemon)
                    }
                }
            }
            .searchable(text: $store.searchText)
            .padding(10)
            .onAppear {
                store.send(.fetchPokemonList)
            }
        }
    }
}

#Preview {
    PokemonListFeatureView(
        store: Store(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        }
    )
}
