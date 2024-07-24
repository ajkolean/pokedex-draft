import ComposableArchitecture
import SwiftUI
import PokemonTypeListFeature

@main
struct PokemonTypeListFeatureExampleApp: App {
    static let store = Store(initialState: PokemonTypeListFeature.State()) {
        PokemonTypeListFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            PokemonTypeListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    PokemonTypeListFeatureView(
        store: Store(initialState: PokemonTypeListFeature.State()) {
            PokemonTypeListFeature()
        }
    )
}
