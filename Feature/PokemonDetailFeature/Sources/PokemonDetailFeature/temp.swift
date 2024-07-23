// import ComposableArchitecture
// import Kingfisher
// import Models
// import SwiftUI
//
// @Reducer
// public struct PokemonDetailFeature {
//    @ObservableState
//    public struct State: Equatable {
//        public var pokemon: Pokemon?
//
//        public init(pokemon: Pokemon? = nil) {
//            self.pokemon = pokemon
//        }
//    }
//
//    public enum Action: Equatable {
//        case onAppear
//    }
//
//    public init() {}
//
//    public var body: some ReducerOf<Self> {
//        Reduce { _, action in
//            switch action {
//            case .onAppear:
//                // You can add any side effects or logic here if needed
//                return .none
//            }
//        }
//    }
// }
//
// public struct PokemonDetailView: View {
//    public let store: StoreOf<PokemonDetailFeature>
//
//    public init(store: StoreOf<PokemonDetailFeature>) {
//        self.store = store
//    }
//
//    public var body: some View {
//        ZStack {
//            LinearGradient(
//                gradient: Gradient(colors: [store.pokemon!.details.backgroundColor, Color.white]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .ignoresSafeArea()
//
//            Color.white.offset(y: 300)
//
//            ScrollView {
//                KFImage(URL(string: store.pokemon!.details.imageURL))
//                    .resizable()
//                    .frame(width: 200, height: 200)
//
//                VStack {
//                    Text(store.pokemon!.details.name.value.capitalized)
//                        .font(.largeTitle)
//                        .padding(.top, 40)
//
//                    Text(store.pokemon!.details.primaryType?.type.name.capitalized ?? "Unknown")
//                        .font(.subheadline).bold()
//                        .foregroundColor(.white)
//                        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
//                        .background(store.pokemon!.details.backgroundColor)
//                        .cornerRadius(20)
//
//                    Text(store.pokemon!.description)
//                        .padding(.horizontal, 32)
//                        .multilineTextAlignment(.center)
//                        .padding(.top, 12)
//
//                    BarChartView(pokemon: store.pokemon!)
//                        .padding(.trailing)
//                        .padding(.top, 24)
//
//                    HStack { Spacer() }
//                }
//                .background(Color.white)
//                .cornerRadius(40)
//                .padding(.top, -40)
//                .zIndex(-1)
//            }
//        }
//        .onAppear {
//            store.send(.onAppear)
//        }
//    }
// }
//
//// #Preview {
////    PokemonDetailFeatureView(
////        store: Store(initialState: PokemonDetailFeature.State()) {
////            PokemonDetailFeature()
////        }
////    )
//// }
