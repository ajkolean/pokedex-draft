import ComposableArchitecture
import SwiftUI

struct ImageCarouselView<Item: Identifiable & Hashable & Sendable, ItemView: View>: View {
    @Binding var selectedItem: Item
    @Binding var items: IdentifiedArrayOf<Item>
    @ViewBuilder var viewForItem: (Item) -> ItemView

    @State private var pageWidth: CGFloat = 250
    private let pageHeight: CGFloat = 350

    var scrollPositionId: Binding<Item.ID?> {
        Binding<Item.ID?>(
            get: { selectedItem.id },
            set: { newValue in
                if let newId = newValue, let item = items.first(where: { $0.id == newId }) {
                    selectedItem = item
                }
            }
        )
    }

    init(
        items: Binding<IdentifiedArrayOf<Item>>,
        selectedItem: Binding<Item>,
        @ViewBuilder viewForItem: @escaping (Item) -> ItemView
    ) {
        _items = items
        _selectedItem = selectedItem
        self.viewForItem = viewForItem
    }

    var body: some View {
        let widthDifference = UIScreen.main.bounds.width - pageWidth

        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(items) { item in
                        viewForItem(item)
                            .frame(height: pageHeight)
                            .containerRelativeFrame([.horizontal])
                            .onTapGesture {
                                withAnimation {
                                    selectedItem = item
                                }
                            }
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.7)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(widthDifference / 2, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: scrollPositionId, anchor: .center)
            .scrollIndicators(.hidden)
            .frame(height: pageHeight * 1.2)
     

//            HStack {
//                ForEach(items) { item in
//                    Button(action: {
//                        withAnimation(.default) {
//                            selectedItem = item
//                        }
//                    }, label: {
//                        Circle()
//                            .fill(Color.gray.opacity(
//                                (item == selectedItem) ? 0.8 : 0.3
//                            ))
//                            .frame(width: 20)
//                    })
//                }
//            }
        }
    }
}
