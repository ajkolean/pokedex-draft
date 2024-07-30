import ComposableArchitecture
import MovesListFeature
import SwiftUI

@main
struct MovesListFeatureExampleApp: App {
    static let store = Store(initialState: MovesListFeature.State()) {
        MovesListFeature()
    }

    var body: some Scene {
        WindowGroup {
            MovesListFeatureView(store: Self.store)
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
