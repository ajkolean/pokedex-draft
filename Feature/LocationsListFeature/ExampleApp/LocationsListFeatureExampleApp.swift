import ComposableArchitecture
import SwiftUI
import LocationsListFeature

@main
struct LocationsListFeatureExampleApp: App {
    static let store = Store(initialState: LocationsListFeature.State()) {
        LocationsListFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            LocationsListFeatureView(store: Self.store)
        }
    }
}

#Preview {
    LocationsListFeatureView(
        store: Store(initialState: LocationsListFeature.State()) {
            LocationsListFeature()
        }
    )
}
