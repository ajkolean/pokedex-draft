// Feature/TypeListFeature/Sources/TypeListFeature/TypeListFeature.swift
import ComposableArchitecture
import Models
import PokemonDetailFeature
import PokemonRepo
import PokemonRepoInterface
import SwiftUI
import TypeDetailFeature

@Reducer
public struct TypeListFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public var typeIdentifiers: IdentifiedArrayOf<TypeIdentifier> = []

        public init() {}
    }

    public enum Action: Equatable {
        case fetchTypeIdentifiers
        case setTypeList(Result<[TypeIdentifier], EquatableError>)
        case typeDetailTapped(TypeIdentifier)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
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
            case .typeDetailTapped:
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
                ForEach(store.typeIdentifiers) { identifier in
                    TypeCardView(identifier: identifier).tappable {
                        store.send(.typeDetailTapped(identifier))
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Types")
        .onAppear {
            store.send(.fetchTypeIdentifiers)
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
