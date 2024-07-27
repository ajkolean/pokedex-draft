// Feature/PokemonListFeature/Sources/PokemonListFeature/PokemonListFeature.swift
import ComposableArchitecture
import PokemonGraphClientInterface
import SwiftUI

@Reducer
public struct PokemonListFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public var pokemonIdentifiers: IdentifiedArrayOf<Pokemon> = []
        public var searchText: String = ""
        
        var filteredPokemons: [Pokemon] {
            var filteredList: [Pokemon] = []
            
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
    
    public enum Action: BindableAction, Equatable, Sendable {
        case binding(BindingAction<State>)
        case fetchPokemonIdentifiers
        case setPokemonList(Result<[Pokemon], NSError>)
        case displayedPokemonCard(Pokemon)
        case setPokemon(Pokemon, Pokemon?)
        case pokemonCardTapped(Pokemon)
    }
    
        @Dependency(\.pokemonAPIClient) var pokemonAPIClient
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .binding:
                return .none
            case .fetchPokemonIdentifiers:
                return .run { [client = pokemonAPIClient] send in
                    do {
                        let pokemon = try await client.fetchPokemon()
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
                //                return .run { send in
                //                    let details = try await pokemonRepo.fetchPokemon(pokemon.name)
                //                    await send(.setPokemon(pokemon, details))
                //                }
                return .none
            case let .setPokemon(identifier, pokemon):
                //                state.pokemon[identifier] = pokemon
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
                ForEach(store.filteredPokemons) { pokemon in
                    
                    PokemonCardView(pokemon: pokemon)
                        .onTapGesture { //tappable
                            store.send(.pokemonCardTapped(pokemon))
                        }
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

#Preview {
    PokemonListFeatureView(
        store: Store(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        }
    )
}
