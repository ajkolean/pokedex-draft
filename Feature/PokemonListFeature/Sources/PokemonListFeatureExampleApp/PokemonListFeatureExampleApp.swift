// Feature/PokemonListFeature/Sources/PokemonListFeatureExampleApp/PokemonListFeatureExampleApp.swift
import ComposableArchitecture
import SwiftUI
import PokemonListFeature

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
