// Feature/PokemonListFeature/Sources/PokemonListFeatureExampleApp/PokemonListFeatureExampleApp.swift
import ComposableArchitecture
import PokemonListFeature
import SwiftUI

@main
struct PokemonListFeatureExampleApp: App {
    static let store = Store(initialState: PokemonListFeature.State()) {
        PokemonListFeature()
    }

    var body: some Scene {
        WindowGroup {
            PokemonListFeatureView(store: Self.store)
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
