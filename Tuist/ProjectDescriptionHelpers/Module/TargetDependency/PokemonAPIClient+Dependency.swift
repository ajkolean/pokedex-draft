import ProjectDescription

extension TargetDependency {
    public static let PokemonAPIClient: TargetDependency = Foundation.PokemonAPIClient.target(.implementation)
    public static let PokemonAPIClientInterface: TargetDependency = Foundation.PokemonAPIClient.target(.interface)
    public static let PokemonAPIClientTests: TargetDependency = Foundation.PokemonAPIClient.target(.tests)

}
