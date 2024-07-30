import ComposableArchitecture
import SwiftUI
import MoveDetailFeature

@main
struct MoveDetailFeatureExampleApp: App {
    static let store = Store(initialState: MoveDetailFeature.State()) {
        MoveDetailFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            MoveDetailFeatureView(store: Self.store)
        }
    }
}

#Preview {
    MoveDetailFeatureView(
        store: Store(initialState: MoveDetailFeature.State()) {
            MoveDetailFeature()
        }
    )
}
