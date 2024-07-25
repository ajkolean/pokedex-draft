import ComposableArchitecture
import SwiftUI
import TypeListFeature

@main
struct TypeListFeatureExampleApp: App {
    static let store = Store(initialState: TypeListFeature.State()) {
        TypeListFeature()
    }

    var body: some Scene {
        WindowGroup {
            TypeListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    TypeListFeatureView(
        store: Store(initialState: TypeListFeature.State()) {
            TypeListFeature()
        }
    )
}
