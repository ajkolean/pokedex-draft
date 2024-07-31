import ComposableArchitecture
import SwiftUI
import TCGCardListFeature

@main
struct TCGCardListFeatureExampleApp: App {
    static let store = Store(initialState: TCGCardListFeature.State()) {
        TCGCardListFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            TCGCardListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    TCGCardListFeatureView(
        store: Store(initialState: TCGCardListFeature.State()) {
            TCGCardListFeature()
        }
    )
}
