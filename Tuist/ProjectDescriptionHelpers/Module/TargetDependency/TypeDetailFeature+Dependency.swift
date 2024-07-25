import ProjectDescription

extension TargetDependency {
    public static let TypeDetailFeature: TargetDependency = Feature.TypeDetailFeature.target(.implementation)
    public static let TypeDetailFeatureExampleApp: TargetDependency = Feature.TypeDetailFeature.target(.exampleApp)
    public static let TypeDetailFeatureTests: TargetDependency = Feature.TypeDetailFeature.target(.tests)
}
