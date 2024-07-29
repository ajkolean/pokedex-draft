// Feature/ItemListFeature/Sources/ItemListFeature/ItemListFeature.swift
import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import SwiftUI

private enum ItemListType {
    case categories
    case items([Item])
}

@Reducer
public struct ItemListFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var itemNames: IdentifiedArrayOf<ItemCategory> = []
        public var searchText: String = ""

        fileprivate var filteredItems: ItemListType {
            var filteredList: [Item] = []

            for item in itemNames.elements.allItems {
                if item._name.contains(searchText.lowercased()) {
                    filteredList.append(item)
                }
            }

            return searchText == "" ? .categories : .items(filteredList)
        }

        public init() {}
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case fetchItemNames
        case setItemCategoryList(Result<[ItemCategory], EquatableError>)
        case itemRowTapped(Item)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

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
                        let categories = try await pokemonRepo.fetchItemCategoryList()
                        await send(.setItemCategoryList(.success(categories)))
                    } catch {
                        await send(.setItemCategoryList(.failure(EquatableError(error))))
                    }
                }
            case let .setItemCategoryList(.success(itemNames)):
                state.itemNames = .init(uniqueElements: itemNames)
                return .none

            case let .setItemCategoryList(.failure(error)):
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
        listView
            .searchable(text: $store.searchText)
            .navigationTitle("Items")
            .onAppear {
                store.send(.fetchItemNames)
            }
    }

    var itemCategoryView: some View {
        List {
            ForEach(store.itemNames) { category in
                Section(category._name) {
                    ForEach(category.items) { item in
                        HStack {
                            KFImage(item.imageUrl)
                                .placeholder { value in
                                    ProgressView(value: value.fractionCompleted)
                                }

                                .onFailureImage(UIImage(systemName: "questionmark.diamond"))
                                .fade(duration: 0.25)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)

                            Text(item._name.capitalized)

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .tappable {
                            store.send(.itemRowTapped(item))
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    var listView: some View {
        switch store.filteredItems {
        case .categories:
            itemCategoryView
        case let .items(items):
            itemView(items: items)
        }
    }

    func itemView(items: [Item]) -> some View {
        List {
            ForEach(items) { item in
                HStack {
                    KFImage(item.imageUrl)
                        .placeholder { value in
                            ProgressView(value: value.fractionCompleted)
                        }
                        .fade(duration: 0.25)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text(item._name.capitalized)
                }
                .tappable {
                    store.send(.itemRowTapped(item))
                }
            }
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
