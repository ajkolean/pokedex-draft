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
    @State private var selectedItem: Item?

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
            .sheet(item: $selectedItem) { item in
                ItemDetailView(item: item)
                    .presentationDetents([.medium, .large])
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
                            selectedItem = item
                            store.send(.itemRowTapped(item))
                        }
                    }
                }
            }
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
                    selectedItem = item
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

public struct ItemDetailView: View {
    let item: Item

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image Section
                KFImage(item.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100) // Adjust the frame size as needed
                    .padding(.top)

                // Title Section
                Text(item._name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple.opacity(0.2))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)

                // Fling Power Section
                if let flingPower = item.flingPower {
                    HStack {
                        Text("Fling Power:")
                            .font(.headline)
                        Text("\(flingPower)")
                    }
                    .boxStyle()
                }

                // Cost Section
                if let cost = item.cost {
                    HStack {
                        Text("Cost:")
                            .font(.headline)
                        Text("\(cost) coins")
                        Spacer()
                    }
                    .boxStyle()
                }

                // Flavor Text Section
                if let flavorText = item.flavorText?.cleaned {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description:")
                            .font(.headline)
                        Text(flavorText)
                            .italic()
                    }
                    .boxStyle()
                }

                // Effect Text Section
                if let effectText = item.effectText?.cleaned {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Effect:")
                            .font(.headline)
                        Text(effectText)
                    }
                    .boxStyle()
                }

                // Fling Effect Section
                if let flingEffect = item.flingEffect {
                    VStack(alignment: .leading) {
                        Text("Fling Effect:")
                            .font(.headline)
                        Text(flingEffect)
                    }
                    .boxStyle()
                }
            }
            .padding()
        }
        .navigationTitle(item._name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockItem = Item(
            _id: 1,
            _name: "Potion",
            flingPower: 10,
            cost: 200,
            flavorText: "Restores HP.",
            effectText: "Restores 20 HP.",
            flingEffect: "None"
        )

        NavigationView {
            ItemDetailView(item: mockItem)
        }
    }
}
