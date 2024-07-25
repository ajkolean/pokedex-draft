import ComposableArchitecture
import Kingfisher
import Models
import SwiftUI

@Reducer
public struct PokemonDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public var pokemon: Pokemon?

        public init(pokemon: Pokemon? = nil) {
            self.pokemon = pokemon
        }
    }

    public enum Action: Equatable {
        case onAppear
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { _, action in
            switch action {
            case .onAppear:
                // You can add any side effects or logic here if needed
                return .none
            }
        }
    }
}

public struct PokemonDetailView: View {
    public let store: StoreOf<PokemonDetailFeature>

    public init(store: StoreOf<PokemonDetailFeature>) {
        self.store = store
    }

    public var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [store.pokemon!.details.backgroundColor, Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Color(UIColor.systemBackground).offset(y: 300)

            ScrollView {
                KFImage(URL(string: store.pokemon!.details.imageURL))
                    .resizable()
                    .frame(width: 200, height: 200)

                VStack {
                    Text(store.pokemon!.details.name.capitalized)
                        .font(.largeTitle)
                        .padding(.top, 40)

                    HStack {
                        ForEach(store.pokemon!.details.types, id: \.self) { type in
                            Text(type.type.name.capitalized)
                                .font(.subheadline).bold()
                                .foregroundColor(Color(UIColor.systemBackground))
                                .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                                .background(type.backgroundColor)
                                .cornerRadius(20)
                        }
                    }

                    HStack {
                        Text("Description")
                            .font(.system(size: 18, weight: .semibold))

                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)

                    HStack {
                        Text(store.pokemon!.description)

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)

                    HStack {
                        Text("Stats")
                            .font(.headline)

                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)

                    VStack {
                        HStack(alignment: .center, spacing: 8) {
                            VStack(alignment: .leading) {
                                Text("Height")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(.bottom, 2)

                                Text(heightToString)
                                    .bold()
                            }
                            .padding(.vertical, 25)
                            .padding(.leading, 16)

                            Spacer()

                            VStack(alignment: .leading) {
                                Text("Weight")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(.bottom, 2)

                                Text(weightToString)
                                    .bold()
                            }
                            .padding(.trailing, 16)
                            .padding(.vertical, 25)
                        }
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .gray, radius: 5, x: 0.0, y: 1.0)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 20)

                    BarChartView(pokemon: store.pokemon!)
                        .padding(.trailing)
                        .padding(.top, 24)

                    HStack { Spacer() }
                }

                .background(Color(UIColor.systemBackground))
                .cornerRadius(40)
                .padding(.top, -40)
                .zIndex(-1)
            }
        }

        .onAppear {
            store.send(.onAppear)
        }
    }

    var heightToString: String {
        let m = (Double(store.pokemon!.details.height) / 10.0)
        let ft = m * 3.281
        return String(format: "%.2f m (%.2f ft)", m, ft)
    }

    var weightToString: String {
        let kg = (Double(store.pokemon!.details.weight) / 10.0)
        let lbs = kg * 2.205
        return String(format: "%.2f kg (%.2f lbs)", kg, lbs)
    }
}

// #Preview {
//    PokemonDetailFeatureView(
//        store: Store(initialState: PokemonDetailFeature.State()) {
//            PokemonDetailFeature()
//        }
//    )
// }
