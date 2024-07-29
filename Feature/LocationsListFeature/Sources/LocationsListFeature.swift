// Feature/LocationsListFeature/Sources/LocationsListFeature/LocationsListFeature.swift
import ComposableArchitecture
import Models
import PokemonRepoInterface
import SwiftUI

private enum ItemListType {
    case locations
    case locationArea([Location.Area])
}

@Reducer
public struct LocationsListFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var locations: IdentifiedArrayOf<Location> = []
        public var searchText: String = ""
        
        fileprivate var filteredItems: ItemListType {
            var filteredList: [Location.Area] = []
            
            for area in locations.elements.allAreas {
                if area._name.contains(searchText.lowercased()) {
                    filteredList.append(area)
                }
            }
            
            return searchText == "" ? .locations : .locationArea(filteredList)
        }
        
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case fetchLocationsList
        case setLocationsList(Result<[Location], EquatableError>)
        case locationAreaTapped(Location.Area)
    }
    
    @Dependency(\.pokemonRepo) var pokemonRepo
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .binding:
                return .none
            case .fetchLocationsList:
                return .run { send in
                    do {
                        let locations = try await pokemonRepo.fetchLocationsList()
                        await send(.setLocationsList(.success(locations)))
                    } catch {
                        await send(.setLocationsList(.failure(EquatableError(error))))
                    }
                }
            case let .setLocationsList(.success(locations)):
                state.locations = .init(uniqueElements: locations)
                return .none
                
            case let .setLocationsList(.failure(error)):
                fatalError("Failed to fetch item list: \(error)")
            case .locationAreaTapped:
                return .none
            }
        }
    }
}

public struct LocationsListFeatureView: View {
    @Bindable public var store: StoreOf<LocationsListFeature>
    
    public init(store: StoreOf<LocationsListFeature>) {
        self.store = store
    }
    
    public var body: some View {
        listView
            .searchable(text: $store.searchText)
            .navigationTitle("Items")
            .onAppear {
                store.send(.fetchLocationsList)
            }
    }
    
    var locationsListView: some View {
        List {
            ForEach(store.locations) { location in
                Section(location._name) {
                    ForEach(location.areas) { area in
                        HStack {
                            Text(area._name.capitalized)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .tappable {
                            store.send(.locationAreaTapped(area))
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var listView: some View {
        switch store.filteredItems {
        case .locations:
            locationsListView
        case let .locationArea(areas):
            locationAreaLisView(areas: areas)
        }
    }
    
    func locationAreaLisView(areas: [Location.Area]) -> some View {
        List {
            ForEach(areas) { area in
                HStack {
                    Text(area._name.capitalized)
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .tappable {
                    store.send(.locationAreaTapped(area))
                }
            }
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
