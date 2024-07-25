// Feature/TypeListFeature/Sources/TypeListFeature/TypeListFeature.swift
import ComposableArchitecture
import Models
import PokemonDetailFeature
import PokemonRepo
import PokemonRepoInterface
import SwiftUI
import TypeDetailFeature

@Reducer
public struct TypeListFeature {
    @ObservableState
    public struct State: Equatable {
        public var typeIdentifiers: IdentifiedArrayOf<TypeIdentifier> = []
        public var path = StackState<TypeDetailFeature.State>()

        public init() {}
    }

    public enum Action: Equatable {
        case fetchTypeIdentifiers
        case setTypeList(Result<[TypeIdentifier], EquatableError>)
        case path(StackAction<TypeDetailFeature.State, TypeDetailFeature.Action>)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchTypeIdentifiers:
                return .run { send in
                    do {
                        let types = try await pokemonRepo.fetchTypeIdentifiers()
                        await send(.setTypeList(.success(types)))
                    } catch {
                        await send(.setTypeList(.failure(EquatableError(error))))
                    }
                }
            case let .setTypeList(.success(types)):
                state.typeIdentifiers = .init(uniqueElements: types)
                return .none

            case let .setTypeList(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error)")
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            TypeDetailFeature()
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
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(store.typeIdentifiers) { identifier in
                        NavigationLink(state: TypeDetailFeature.State(typeIdentifier: identifier)) {
                            TypeCardView(identifier: identifier)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Types")
            .onAppear {
                store.send(.fetchTypeIdentifiers)
            }
        } destination: { store in
            TypeDetailView(store: store)
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
