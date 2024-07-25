import ComposableArchitecture
import Kingfisher
import Models
import PokemonRepo
import PokemonRepoInterface
import SwiftUI

extension TypeIdentifier {
    public static let fire = TypeIdentifier(name: "fire", url: URL(string: "https://pokeapi.co/api/v2/type/fire")!)
}

@Reducer
public struct TypeDetailFeature {
    @ObservableState
    public struct State: Equatable {
        public let typeIdentifier: TypeIdentifier
        public var typeDetails: PokemonTypeDetails?

        public init(typeIdentifier: TypeIdentifier) {
            self.typeIdentifier = typeIdentifier
        }
    }

    public enum Action: Equatable {
        case onAppear
        case setTypeDetails(Result<PokemonTypeDetails?, EquatableError>)
    }

    @Dependency(\.pokemonRepo) var pokemonRepo

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { [identifer = state.typeIdentifier] send in
                    do {
                        let types = try await pokemonRepo.fetchPokemonTypeDetails(identifer.name)
                        await send(.setTypeDetails(.success(types)))
                    } catch {
                        await send(.setTypeDetails(.failure(EquatableError(error))))
                    }
                }
            case let .setTypeDetails(.success(details)):
                state.typeDetails = details
                return .none
            case let .setTypeDetails(.failure(error)):
                print(error.localizedDescription)
                return .none
            }
        }
    }
}

public struct TypeDetailView: View {
    public let store: StoreOf<TypeDetailFeature>

    public init(store: StoreOf<TypeDetailFeature>) {
        self.store = store
    }

    public var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [store.typeIdentifier.type.color(), Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Color(UIColor.systemBackground).offset(y: 300)

            ScrollView {
                store
                    .typeIdentifier
                    .type
                    .pokemonImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)

                VStack {
                    HStack(alignment: .center) {
                        store.typeIdentifier.type.icon
                            .resizable()
                            .renderingMode(.template)
                            .opacity(0.5)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .frame(width: 50, height: 50)
                        Text(store.typeIdentifier.name.uppercased())
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color(UIColor.systemBackground))
                    }
                    .padding()
                    .background(store.typeIdentifier.type.color())
                    .cornerRadius(20)
                    .shadow(color: store.typeIdentifier.type.color(), radius: 4, x: 1.0, y: 1.0)
                    .padding(.top, 75)

                    if let typeDetails = store.typeDetails {
                        DamageRelationsStackView(typeIdentifier: store.typeIdentifier, typeDetails: typeDetails)
                            .padding(.top, 24)
                    }
                    
                    Text("Pokemon")
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(store.typeIdentifier.type.color().opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(color: store.typeIdentifier.type.color(), radius: 4, x: 1.0, y: 1.0)

                    HStack {
                        Text("Description")
                            .font(.system(size: 18, weight: .semibold))
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)

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
}
