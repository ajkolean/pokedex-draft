import ProjectDescription

extension TargetDependency {
    public static let PokemonDataStoreClientImplementation: TargetDependency = Foundation.PokemonDataStoreClient.target(.implementation)
    public static let PokemonDataStoreClientInterface: TargetDependency = Foundation.PokemonDataStoreClient.target(.interface)
    public static let PokemonDataStoreClientTestSupport: TargetDependency = Foundation.PokemonDataStoreClient.target(.testSupport)
    public static let PokemonDataStoreClientTests: TargetDependency = Foundation.PokemonDataStoreClient.target(.tests)

}