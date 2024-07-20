// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonListFeature.swift
import ComposableArchitecture
import SwiftUI
import Models

@Reducer
public struct PokemonListFeature {
    @ObservableState
    public struct State: Equatable {
        public var pokemons: IdentifiedArrayOf<Pokemon> = IdentifiedArrayOf<Pokemon>(uniqueElements: Pokemon.mockData)
        public var searchText: String = ""

        var filteredPokemons: [Pokemon] {
            var filteredList: [Pokemon] = []

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
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { _, _ in
            return .none
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
                        Text(pokemon.name)
                    }
                }
            }
            .searchable(text: $store.searchText)
            .padding(10)
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
