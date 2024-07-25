import ComposableArchitecture
import SwiftUI
import TypeDetailFeature

@main
struct TypeDetailFeatureExampleApp: App {
    static let store = Store(initialState: TypeDetailFeature.State(typeIdentifier: .fire)) {
        TypeDetailFeature()
    }

    var body: some Scene {
        WindowGroup {
            TypeDetailView(store: Self.store)
        }
    }
}

#Preview {
    TypeDetailView(
        store: Store(initialState: TypeDetailFeature.State(typeIdentifier: .fire)) {
            TypeDetailFeature()
        }
    )
}
