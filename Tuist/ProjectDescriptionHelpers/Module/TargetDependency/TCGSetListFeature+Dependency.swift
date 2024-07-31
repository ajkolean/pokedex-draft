import ProjectDescription

extension TargetDependency {
    public static let TCGSetListFeature: TargetDependency = Feature.TCGSetListFeature.target(.implementation)
    public static let TCGSetListFeatureExampleApp: TargetDependency = Feature.TCGSetListFeature.target(.exampleApp)
    public static let TCGSetListFeatureTests: TargetDependency = Feature.TCGSetListFeature.target(.tests)
}