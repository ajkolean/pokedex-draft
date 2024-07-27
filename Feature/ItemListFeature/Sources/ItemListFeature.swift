// Feature/ItemListFeature/Sources/ItemListFeature/ItemListFeature.swift
import ComposableArchitecture
import Kingfisher
import Models
import PokemonAPIClient
import PokemonAPIClientInterface
import SwiftUI

@Reducer
public struct ItemListFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public var itemNames: IdentifiedArrayOf<ItemName> = []
        public var searchText: String = ""

        var filteredItems: [ItemName] {
            var filteredList: [ItemName] = []

            for item in itemNames {
                if item.rawValue.contains(searchText.lowercased()) {
                    filteredList.append(item)
                }
            }

            return searchText == "" ? itemNames.elements : filteredList
        }

        public init() {}
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case fetchItemNames
        case setItemList(Result<[ItemName], EquatableError>)
        case itemRowTapped(ItemName)
    }

    @Dependency(\.apiClient) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .binding:
                return .none
            case .fetchItemNames:
                return .run { send in
                    do {
                        let items = try await pokemonRepo.fetchItemList(limit: 30, offset: 0)
                        await send(.setItemList(.success(items)))
                    } catch {
                        await send(.setItemList(.failure(EquatableError(error))))
                    }
                }
            case let .setItemList(.success(itemNames)):
                state.itemNames = .init(uniqueElements: itemNames)
                return .none

            case let .setItemList(.failure(error)):
                fatalError("Failed to fetch item list: \(error)")
            case .itemRowTapped:
                return .none
            }
        }
    }
}

public struct ItemListFeatureView: View {
    @Bindable public var store: StoreOf<ItemListFeature>

    public init(store: StoreOf<ItemListFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            ForEach(store.filteredItems) { item in

                HStack {
                    KFImage(item.imageUrl)
                        .placeholder { value in
                            ProgressView(value: value.fractionCompleted)
                        }
                        .fade(duration: 0.25)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text(item.rawValue.capitalized)
                }
            }
        }
        .searchable(text: $store.searchText)
        .navigationTitle("Items")
        .onAppear {
            store.send(.fetchItemNames)
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

extension ItemName {
    var imageUrl: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/\(rawValue).png")!
    }
}
