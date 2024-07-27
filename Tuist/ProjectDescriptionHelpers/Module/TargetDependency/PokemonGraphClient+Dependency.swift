import ProjectDescription

extension TargetDependency {
    public static let PokemonGraphClient: TargetDependency = Foundation.PokemonGraphClient.target(.implementation)
    public static let PokemonGraphClientInterface: TargetDependency = Foundation.PokemonGraphClient.target(.interface)
    public static let PokemonGraphClientTests: TargetDependency = Foundation.PokemonGraphClient.target(.tests)

}