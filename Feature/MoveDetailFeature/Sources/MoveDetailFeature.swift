import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepoInterface
import SwiftUI

@Reducer
public struct MoveDetailFeature: Reducer {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var move: Move?
        public let moveSummary: Move.Summary

        public init(moveSummary: Move.Summary) {
            self.moveSummary = moveSummary
        }
    }

    public enum Action: Equatable, Sendable {
        case onAppear
        case setMove(Result<Move, EquatableError>)
        case pokemonCardTapped(PokemonSummary)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .run { [summary = state.moveSummary] send in
                    do {
                        let move = try await pokemonRepo.fetchMove(name: summary.name)
                        await send(.setMove(.success(move)))
                    } catch {
                        await send(.setMove(.failure(EquatableError(error))))
                    }
                }
            case let .setMove(.success(move)):
                state.move = move
                return .none

            case let .setMove(.failure(error)):
                fatalError("Failed to fetch move: \(error)")
            case .pokemonCardTapped:
                return .none
            }
        }
    }
}

public struct MoveDetailView: View {
    public var store: StoreOf<MoveDetailFeature>

    public init(store: StoreOf<MoveDetailFeature>) {
        self.store = store
    }

    @ViewBuilder
    var imageView: some View {
        if let randomePokemon = store.move?.pokemon.randomElement() {
            KFImage(URL(string: randomePokemon.imageURL))
                .resizable()
                .frame(width: 200, height: 200)
                .background(
                    ModelsAsset
                        .spinningball
                        .swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .opacity(0.2)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(width: 250, height: 250)
                )
        } else {
            store
                .moveSummary
                .type
                .pokemonImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
        }
    }

    public var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [store.moveSummary.type.color(), Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Color(UIColor.systemBackground).offset(y: 300)

            ScrollView {
                imageView

                VStack {
                    Group {
                        HStack(alignment: .center) {
                            store.moveSummary.type.icon
                                .resizable()
                                .renderingMode(.template)
                                .opacity(0.5)
                                .foregroundColor(Color(UIColor.systemBackground))
                                .frame(width: 50, height: 50)
                            Text(store.moveSummary.name.rawValue.uppercased())
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                        }
                        .padding()
                        .background(store.moveSummary.type.color())
                        .cornerRadius(20)
                        .shadow(color: store.moveSummary.type.color(), radius: 4, x: 1.0, y: 1.0)
                        .padding(.top, 75)

                        HStack {
                            Text("Stats")
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
                        .padding(.vertical)

                        MoveDetailStatView(move: store.moveSummary)
                    }

                    if let move = store.move {
                        Group {
                            if let description = move.longDescription {
                                HStack {
                                    Text("Description")
                                        .font(.title2)
                                        .bold()
                                    Spacer()
                                }
                                .padding(.vertical)

                                HStack {
                                    Text(description.cleaned)
                                    Spacer()
                                }
                            }
                            if let effect = move.moveEffectTextFormatted {
                                HStack(spacing: 16) {
                                    Text("Effect")
                                        .font(.title2)
                                        .bold()

                                    HStack(spacing: 0) {
                                        move
                                            .damageClass
                                            .icon
                                            .resizable()
                                            .renderingMode(.template)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(UIColor.systemBackground))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(move.damageClass.color)
                                            .shadow(color: move.damageClass.color.opacity(0.6), radius: 4, x: 0, y: 2)

                                        Text(move.damageClass.rawValue.capitalized)
                                            .font(.body)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(.leading, 6)
                                            .padding(.trailing, 12)
                                            .lineLimit(1)
                                    }
                                    .background(Color.gray)
                                    .clipShape(Capsule())
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)

                                    Spacer()
                                }
                                .padding(.vertical)

                                HStack {
                                    Text(effect)
                                    Spacer()
                                }
                            }
                        }

                        Text("Pokemon")
                            .font(.title2)
                            .bold()
                            .padding()
                            .background(store.moveSummary.type.color().opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(color: store.moveSummary.type.color(), radius: 4, x: 1.0, y: 1.0)
                            .padding(.vertical, 24)

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(move.pokemon) { pokemon in
                                PokemonCardView(pokemon: pokemon)
                                    .tappable {
                                        store.send(.pokemonCardTapped(pokemon))
                                    }
                            }
                        }
                    }
                }
                .padding(.horizontal)
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
}
