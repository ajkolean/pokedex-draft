import ComposableArchitecture
import PokemonListFeature
import SwiftUI

@Reducer
public struct AppFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}

        public var pokemonListFeature = PokemonListFeature.State()
    }

    public enum Action {
        case pokemonListFeature(PokemonListFeature.Action)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Scope(state: \.pokemonListFeature, action: \.pokemonListFeature) {
            PokemonListFeature()
        }
        Reduce { _, _ in
            return .none
        }
    }
}

public struct AppView: View {
    @Bindable public var store: StoreOf<AppFeature>

    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }

    public var body: some View {
        PokemonListFeatureView(store: store.scope(state: \.pokemonListFeature, action: \.pokemonListFeature))
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
