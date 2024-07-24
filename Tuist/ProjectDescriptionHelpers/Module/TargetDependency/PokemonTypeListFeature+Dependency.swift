import ProjectDescription

extension TargetDependency {
    public static let PokemonTypeListFeatureImplementation: TargetDependency = Feature.PokemonTypeListFeature.target(.implementation)
    public static let PokemonTypeListFeatureExampleApp: TargetDependency = Feature.PokemonTypeListFeature.target(.exampleApp)
    public static let PokemonTypeListFeatureTests: TargetDependency = Feature.PokemonTypeListFeature.target(.tests)
}