// Feature/MovesListFeature/Sources/MovesListFeature/MovesListFeature.swift
import ComposableArchitecture

import Models
import PokemonRepoInterface
import SwiftUI

@Reducer
public struct MovesListFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var moves: IdentifiedArrayOf<Move.Summary> = []

        public init() {}
    }

    public enum Action: Equatable, Sendable {
        case onAppear
        case setMoves(Result<[Move.Summary], EquatableError>)
        case moveTapped(Move.Summary)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .run { [pokemonRepo = self.pokemonRepo] send in
                    do {
                        let moves = try await pokemonRepo.fetchMoveSummaryList()
                        await send(.setMoves(.success(moves)))
                    } catch {
                        await send(.setMoves(.failure(EquatableError(error))))
                    }
                }
            case let .setMoves(.success(moves)):
                state.moves = .init(uniqueElements: moves)
                return .none

            case let .setMoves(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error)")
            case .moveTapped:
                return .none
            }
        }
    }
}

public struct MovesListFeatureView: View {
    @Bindable public var store: StoreOf<MovesListFeature>
    private let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    public init(store: StoreOf<MovesListFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(store.moves) { move in
                    MoveCardView(move: move)
                        .tappable {
                            store.send(.moveTapped(move))
                        }
                }
            }
            .padding()
        }
        .navigationTitle("Moves")
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    MovesListFeatureView(
        store: Store(initialState: MovesListFeature.State()) {
            MovesListFeature()
        }
    )
}
