import ProjectDescription

extension TargetDependency {
    public static let TypeDetailFeatureImplementation: TargetDependency = Feature.TypeDetailFeature.target(.implementation)
    public static let TypeDetailFeatureExampleApp: TargetDependency = Feature.TypeDetailFeature.target(.exampleApp)
    public static let TypeDetailFeatureTests: TargetDependency = Feature.TypeDetailFeature.target(.tests)
}