// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonListFeature.swift
import ComposableArchitecture
import Models
import PokemonRepo
import PokemonRepoInterface
import SwiftUI

@Reducer
public struct PokemonListFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public var pokemonIdentifiers: IdentifiedArrayOf<PokemonIdentifier> = []
        public var pokemon = [PokemonIdentifier: Pokemon]()
        public var searchText: String = ""
        
        var filteredPokemons: [PokemonIdentifier] {
            var filteredList: [PokemonIdentifier] = []
            
            for pokemon in pokemonIdentifiers {
                if pokemon.name.contains(searchText.lowercased()) {
                    filteredList.append(pokemon)
                } else if searchText == "\(pokemon.id)" {
                    filteredList.append(pokemon)
                }
            }
            
            return searchText == "" ? pokemonIdentifiers.elements : filteredList
        }
        
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case fetchPokemonIdentifiers
        case setPokemonList(Result<[PokemonIdentifier], NSError>)
        case displayedPokemonCard(PokemonIdentifier)
        case setPokemon(PokemonIdentifier, Pokemon?)
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
                return .run { send in
                    do {
                        let pokemon = try await pokemonRepo.fetchPokemonIdentifiers()
                        await send(.setPokemonList(.success(pokemon)))
                    } catch {
                        await send(.setPokemonList(.failure(error as NSError)))
                    }
                }
            case let .setPokemonList(.success(pokemonIdentifiers)):
                state.pokemonIdentifiers = .init(uniqueElements: pokemonIdentifiers)
                return .none
                
            case let .setPokemonList(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error)")
            case let .displayedPokemonCard(pokemon):
                return .run { send in
                    let details = try await pokemonRepo.fetchPokemon(pokemon.name)
                    await send(.setPokemon(pokemon, details))
                }
            case let .setPokemon(identifier, pokemon):
                state.pokemon[identifier] = pokemon
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
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(store.filteredPokemons) { identifier in
                    let pokemon = store.pokemon[identifier]
                    
                    PokemonCardView(identifier: identifier, pokemon: pokemon)
                        .unWrapping(pokemon) { view, pokemon in
                            view.tappable {
                                store.send(.pokemonCardTapped(pokemon))
                            }
                        }
                        .onAppear {
                            store.send(.displayedPokemonCard(identifier))
                        }
                        .disabled(pokemon == nil)
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

#Preview {
    PokemonListFeatureView(
        store: Store(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        }
    )
}
