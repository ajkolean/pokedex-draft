import ProjectDescription

extension TargetDependency {
    public static let PokemonDataStoreClient: TargetDependency = Foundation.PokemonDataStoreClient.target(.implementation)
    public static let PokemonDataStoreClientInterface: TargetDependency = Foundation.PokemonDataStoreClient.target(.interface)
    public static let PokemonDataStoreClientTests: TargetDependency = Foundation.PokemonDataStoreClient.target(.tests)

}
