import ComposableArchitecture
import SwiftUI
import TCGSetListFeature

@main
struct TCGSetListFeatureExampleApp: App {
    static let store = Store(initialState: TCGSetListFeature.State()) {
        TCGSetListFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            TCGSetListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    TCGSetListFeatureView(
        store: Store(initialState: TCGSetListFeature.State()) {
            TCGSetListFeature()
        }
    )
}
