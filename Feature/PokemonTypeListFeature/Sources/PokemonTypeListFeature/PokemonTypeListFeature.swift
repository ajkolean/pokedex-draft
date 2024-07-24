import ComposableArchitecture
import SwiftUI

@Reducer
public struct PokemonTypeListFeature {
    @ObservableState
    public struct State: Equatable {
        public init() { }
    }
    
    public enum Action {

    }
    
    public init() { }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

public struct PokemonTypeListFeatureView: View {
    @Bindable public var store: StoreOf<PokemonTypeListFeature>
    
    public init(store: StoreOf<PokemonTypeListFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("PokemonTypeListFeature")
    }
}

#Preview {
    PokemonTypeListFeatureView(
        store: Store(initialState: PokemonTypeListFeature.State()) {
            PokemonTypeListFeature()
        }
    )
}
