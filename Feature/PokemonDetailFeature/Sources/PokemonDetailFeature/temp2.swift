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
//        ScrollView {
//            VStack {
//
//                ZStack {
//                    // simply remove this line for clean white background
//                    LinearGradient(gradient: Gradient(colors: [store.pokemon?.details.backgroundColor ?? .clear, Color.white]), startPoint: .top, endPoint: .center)
//                        .ignoresSafeArea()
//
//                    VStack {
//
//                        HStack {
//                            Spacer()
//
//                            ZStack {
//
//                                Text("003")
//                                    .font(.headline).bold()
//                                    .foregroundColor(.white)
//                                    .offset(x: 150, y: -100)
//
//
//                                KFImage(URL(string: store.pokemon!.details.imageURL))
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 200, height: 200)
//                                    .padding([.bottom, .trailing], 10)
//                                    .padding(.top, 40)
//                            }
//                            .padding(.top, 10)
//
//                            Spacer()
//                        }
//
//                        VStack {
//                            Text(store.pokemon!.details.name.value.capitalized)
//                                .font(.largeTitle)
//
//                            Text(store.pokemon!.details.primaryType?.type.name.capitalized ?? "")
//                                .font(.subheadline).bold()
//                                .foregroundColor(.white)
//                                .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
//                                .background(store.pokemon?.details.backgroundColor ?? .clear)
//                                .cornerRadius(20)
//                                .padding(.top, -12)
//
//                            HStack() {
//                                Text("Description")
//                                    .font(.system(size: 18, weight: .semibold))
//                                    .padding(.bottom, 8)
//
//                                Spacer()
//                            }
//                            .padding(.top, 10)
//
//                            Text(store.pokemon?.description ?? "")
//                                .padding(0)
//
//                            //                            StatsViews(pokemon: pokemon)
//                        }
//                        .padding(.horizontal, 20)
//                        .padding(.bottom, 50)
//                    }
//                }
//                .background(.white)
//                .cornerRadius(40)
//                .padding(.top, -100)
//                .zIndex(1)
//            }
//        }
//        .navigationBarTitleDisplayMode(.inline)
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
