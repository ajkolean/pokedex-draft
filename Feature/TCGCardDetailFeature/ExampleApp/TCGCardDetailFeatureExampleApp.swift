import ComposableArchitecture
import SwiftUI
import TCGCardDetailFeature

@main
struct TCGCardDetailFeatureExampleApp: App {
    static let store = Store(initialState: TCGCardDetailFeature.State()) {
        TCGCardDetailFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            TCGCardDetailFeatureView(store: Self.store)
        }
    }
}

#Preview {
    TCGCardDetailFeatureView(
        store: Store(initialState: TCGCardDetailFeature.State()) {
            TCGCardDetailFeature()
        }
    )
}
