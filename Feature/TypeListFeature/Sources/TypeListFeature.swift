// Feature/TypeListFeature/Sources/TypeListFeature/TypeListFeature.swift
import ComposableArchitecture
import PokemonGraphClientInterface
import SwiftUI

@Reducer
public struct TypeListFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public var pokemonTypes: IdentifiedArrayOf<PokemonType> = []

        public init() {}
    }

    public enum Action: Equatable, Sendable {
        case fetchPokemonTypes
        case setPokemonTypes(Result<[PokemonType], EquatableError>)
        case pokemonTypeTapped(PokemonType)
    }

    @Dependency(\.pokemonAPIClient) var pokemonAPIClient

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .fetchPokemonTypes:
                return .run { send in
                    do {
                        let types = try await pokemonAPIClient.fetchPokemonTypeList()
                        await send(.setPokemonTypes(.success(types)))
                    } catch {
                        await send(.setPokemonTypes(.failure(EquatableError(error))))
                    }
                }
            case let .setPokemonTypes(.success(types)):
                state.pokemonTypes = .init(uniqueElements: types)
                return .none

            case let .setPokemonTypes(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error)")
            case .pokemonTypeTapped:
                return .none
            }
        }
    }
}

public struct TypeListFeatureView: View {
    @Bindable public var store: StoreOf<TypeListFeature>
    private let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    public init(store: StoreOf<TypeListFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(store.pokemonTypes) { pokemonType in
                    TypeCardView(pokemonType: pokemonType)
                        .tappable {
                        store.send(.pokemonTypeTapped(pokemonType))
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Types")
        .onAppear {
            store.send(.fetchPokemonTypes)
        }
    }
}

#Preview {
    TypeListFeatureView(
        store: Store(initialState: TypeListFeature.State()) {
            TypeListFeature()
        }
    )
}
