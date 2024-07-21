import ProjectDescription

extension TargetDependency {
    public static let PokemonAPIClientImplementation: TargetDependency = Foundation.PokemonAPIClient.target(.implementation)
    public static let PokemonAPIClientInterface: TargetDependency = Foundation.PokemonAPIClient.target(.interface)
    public static let PokemonAPIClientTestSupport: TargetDependency = Foundation.PokemonAPIClient.target(.testSupport)
    public static let PokemonAPIClientTests: TargetDependency = Foundation.PokemonAPIClient.target(.tests)

}