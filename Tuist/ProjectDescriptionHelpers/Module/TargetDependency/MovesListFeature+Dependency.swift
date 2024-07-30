import ProjectDescription

extension TargetDependency {
    public static let MovesListFeature: TargetDependency = Feature.MovesListFeature.target(.implementation)
    public static let MovesListFeatureExampleApp: TargetDependency = Feature.MovesListFeature.target(.exampleApp)
    public static let MovesListFeatureTests: TargetDependency = Feature.MovesListFeature.target(.tests)
}