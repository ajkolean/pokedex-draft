import ProjectDescription

extension TargetDependency {
    public static let PokemonDetailFeatureImplementation: TargetDependency = Feature.PokemonDetailFeature.target(.implementation)
    public static let PokemonDetailFeatureExampleApp: TargetDependency = Feature.PokemonDetailFeature.target(.exampleApp)
    public static let PokemonDetailFeatureTests: TargetDependency = Feature.PokemonDetailFeature.target(.tests)
}