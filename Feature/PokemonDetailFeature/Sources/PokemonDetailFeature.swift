import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepoInterface
import SwiftUI

@Reducer
public struct PokemonDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public let pokemonSummary: PokemonSummary
        public var pokemon: Pokemon?

        public init(pokemonSummary: PokemonSummary, pokemon: Pokemon? = nil) {
            self.pokemonSummary = pokemonSummary
            self.pokemon = pokemon
        }
    }

    public enum Action: Equatable, Sendable {
        case onAppear
        case setPokemon(Result<Pokemon, EquatableError>)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .run { [pokemon = state.pokemon] send in
                    do {
                        let pokemon = try await pokemonRepo.fetchPokemon(name: pokemon?.name ?? "charmander")
                        await send(.setPokemon(.success(pokemon)))
                    } catch {
                        await send(.setPokemon(.failure(EquatableError(error))))
                    }
                }
            case let .setPokemon(.success(pokemon)):
                state.pokemon = pokemon
                return .none

            case let .setPokemon(.failure(error)):
                fatalError("Failed to fetch item list: \(error)")
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
                gradient: Gradient(colors: [store.pokemonSummary.primaryType.color(), Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Color(UIColor.systemBackground).offset(y: 300)

            ScrollView {
                KFImage(URL(string: store.pokemonSummary.imageURL))
                    .resizable()
                    .frame(width: 200, height: 200)
                    .background(
                        store
                            .pokemonSummary
                            .primaryType
                            .icon
//                            .spinningball
//                            .swiftUIImage
                            .resizable()
                            .renderingMode(.template)
                            .opacity(0.2)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .frame(width: 250, height: 250)
                    )

                VStack {
                    Text(store.pokemonSummary.name.rawValue.capitalized)
                        .font(.largeTitle)
                        .padding(.top, 40)

                    HStack {
                        ForEach(store.pokemonSummary.types, id: \.self) { type in
                            Text(type.type.rawValue.capitalized)
                                .font(.subheadline).bold()
                                .foregroundColor(Color(UIColor.systemBackground))
                                .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                                .background(type.type.color())
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
                        Text(store.pokemon?.descriptions.first ?? "")

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
                    if let pokemon = store.pokemon {
                        BarChartView(pokemon: pokemon)
                            .padding(.trailing)
                            .padding(.top, 24)
                    }

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
        guard let height = store.pokemon?.height else { return "?????" }
        let m = (Double(height) / 10.0)
        let ft = m * 3.281
        return String(format: "%.2f m (%.2f ft)", m, ft)
    }

    var weightToString: String {
        guard let weight = store.pokemon?.weight else { return "?????" }
        let kg = (Double(weight) / 10.0)
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
