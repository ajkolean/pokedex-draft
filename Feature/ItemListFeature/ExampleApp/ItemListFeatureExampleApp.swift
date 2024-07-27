import ComposableArchitecture
import ItemListFeature
import SwiftUI

@main
struct ItemListFeatureExampleApp: App {
    static let store = Store(initialState: ItemListFeature.State()) {
        ItemListFeature()
    }

    var body: some Scene {
        WindowGroup {
            ItemListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    ItemListFeatureView(
        store: Store(initialState: ItemListFeature.State()) {
            ItemListFeature()
        }
    )
}
