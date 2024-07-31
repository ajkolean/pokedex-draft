import ComposableArchitecture
import Models
import PokemonRepoInterface
import SwiftUI

@Reducer
public struct RegionListFeature {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var regions: IdentifiedArrayOf<Region> = []

        public init() {}
    }

    public enum Action: Equatable, Sendable {
        case onAppear
        case regionTapped(_ region: Region)
        case setRegionList([Region])
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    let regions = try await pokemonRepo.fetchRegionList()
                    await send(.setRegionList(regions))
                }
            case let .setRegionList(regions):
                state.regions = .init(uniqueElements: regions)
                return .none
            case .regionTapped:
                return .none
            }
        }
    }
}

public struct RegionListFeatureView: View {
    public var store: StoreOf<RegionListFeature>

    public init(store: StoreOf<RegionListFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            ForEach(store.regions) { region in
                HStack {
                    Text(region._name.capitalized)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .contentShape(Rectangle())
                .tappable {
                    store.send(.regionTapped(region))
                }
            }
        }
        .navigationTitle("Regions")
        .onAppear {
            store.send(.onAppear)
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
