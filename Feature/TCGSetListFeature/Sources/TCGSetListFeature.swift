import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import SwiftUI

@Reducer
public struct TCGSetListFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var sets: IdentifiedArrayOf<TCG.Set> = []

        public init() {}
    }

    public enum Action: Equatable, Sendable {
        case fetchTCGSets
        case setTCGSets(Result<[TCG.Set], EquatableError>)
        case tcgSetTapped(TCG.Set)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .fetchTCGSets:
                return .run { [pokemonRepo = self.pokemonRepo] send in
                    do {
                        let types = try await pokemonRepo.fetchAllTCGSets()
                        await send(.setTCGSets(.success(types)))
                    } catch {
                        await send(.setTCGSets(.failure(EquatableError(error))))
                    }
                }
            case let .setTCGSets(.success(sets)):
                state.sets = .init(uniqueElements: sets)
                return .none

            case let .setTCGSets(.failure(error)):
                fatalError("Failed to fetch pokemon list: \(error)")
            case .tcgSetTapped:
                return .none
            }
        }
    }
}

public struct TCGSetListFeatureView: View {
    @Bindable public var store: StoreOf<TCGSetListFeature>
    private let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    public init(store: StoreOf<TCGSetListFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                ForEach(store.sets) { set in
                    VStack(spacing: 16) {
                        Text(set.name)
                            .font(.headline)
                        Text("Total cards: \(set.total)")
                        HStack {
                            Spacer()
                            KFImage(set.images.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .tappable {
                                    store.send(.tcgSetTapped(set))
                                }
                            Spacer()
                        }
                    }
                    .frame(height: 200)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Card Sets")
        .onAppear {
            store.send(.fetchTCGSets)
        }
    }
}

#Preview {
    TCGSetListFeatureView(
        store: Store(initialState: TCGSetListFeature.State()) {
            TCGSetListFeature()
        }
    )
}
