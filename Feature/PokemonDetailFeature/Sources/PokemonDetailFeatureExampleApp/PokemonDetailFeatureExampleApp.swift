import ComposableArchitecture
import PokemonDetailFeature
import SwiftUI

@main
struct PokemonDetailFeatureExampleApp: App {
    static let store = Store(initialState: PokemonDetailFeature.State()) {
        PokemonDetailFeature()
    }

    var body: some Scene {
        WindowGroup {
            PokemonDetailView(store: Self.store)
        }
    }
}

#Preview {
    PokemonDetailView(
        store: Store(initialState: PokemonDetailFeature.State()) {
            PokemonDetailFeature()
        }
    )
}
