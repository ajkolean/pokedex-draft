import ProjectDescription

extension TargetDependency {
    public static let ItemListFeature: TargetDependency = Feature.ItemListFeature.target(.implementation)
    public static let ItemListFeatureExampleApp: TargetDependency = Feature.ItemListFeature.target(.exampleApp)
    public static let ItemListFeatureTests: TargetDependency = Feature.ItemListFeature.target(.tests)
}