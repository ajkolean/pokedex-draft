// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonListFeature.swift
import ComposableArchitecture
import Models
import PokemonRepo
import PokemonRepoInterface
import SwiftUI

@Reducer
public struct PokemonListFeature {
    @ObservableState
    public struct State: Equatable {
        public var pokemons: IdentifiedArrayOf<PokemonIdentifier> = []
        public var pokemonDetails = [PokemonIdentifier: PokemonDetails]()
        public var searchText: String = ""

        var filteredPokemons: [PokemonIdentifier] {
            var filteredList: [PokemonIdentifier] = []

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
        case fetchPokemonIdentifiers
        case setPokemonList(Result<[PokemonIdentifier], Error>)
        case displayedPokemonCard(PokemonIdentifier)
        case setPokemonDetails(PokemonIdentifier, PokemonDetails?)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .fetchPokemonIdentifiers:
                return .run { send in
                    do {
                        let pokemon = try await pokemonRepo.fetchPokemonIdentifiers()
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
            case let .displayedPokemonCard(pokemon):
                return .run { send in
                    let details = try await pokemonRepo.fetchPokemon(pokemon.name)
                    await send(.setPokemonDetails(pokemon, details))
                }
            case let .setPokemonDetails(identifier, details):
                state.pokemonDetails[identifier] = details
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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(store.filteredPokemons) { pokemon in
                        PokemonCardView(pokemon: pokemon, pokemonDetails: store.pokemonDetails[pokemon])
                            .onAppear {
                                store.send(.displayedPokemonCard(pokemon))
                            }
                    }
                }
            }
            .searchable(text: $store.searchText)
            .navigationTitle("Pokédex")
            .onAppear {
                store.send(.fetchPokemonIdentifiers)
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
