import ComposableArchitecture
import RegionListFeature
import SwiftUI

@main
struct RegionListFeatureExampleApp: App {
    static let store = Store(initialState: RegionListFeature.State()) {
        RegionListFeature()
    }

    var body: some Scene {
        WindowGroup {
            RegionListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    RegionListFeatureView(
        store: Store(initialState: RegionListFeature.State()) {
            RegionListFeature()
        }
    )
}
