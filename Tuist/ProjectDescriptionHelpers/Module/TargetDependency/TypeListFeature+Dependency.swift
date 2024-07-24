import ProjectDescription

extension TargetDependency {
    public static let TypeListFeatureImplementation: TargetDependency = Feature.TypeListFeature.target(.implementation)
    public static let TypeListFeatureExampleApp: TargetDependency = Feature.TypeListFeature.target(.exampleApp)
    public static let TypeListFeatureTests: TargetDependency = Feature.TypeListFeature.target(.tests)
}