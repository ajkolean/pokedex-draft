import ProjectDescription

extension TargetDependency {
    public static let PokemonListFeature: TargetDependency = Feature.PokemonListFeature.target(.implementation)
    public static let PokemonListFeatureExampleApp: TargetDependency = Feature.PokemonListFeature.target(.exampleApp)
    public static let PokemonListFeatureTests: TargetDependency = Feature.PokemonListFeature.target(.tests)
}
