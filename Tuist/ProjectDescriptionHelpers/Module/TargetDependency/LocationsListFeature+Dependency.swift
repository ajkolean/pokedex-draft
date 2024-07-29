import ProjectDescription

extension TargetDependency {
    public static let LocationsListFeature: TargetDependency = Feature.LocationsListFeature.target(.implementation)
    public static let LocationsListFeatureExampleApp: TargetDependency = Feature.LocationsListFeature.target(.exampleApp)
    public static let LocationsListFeatureTests: TargetDependency = Feature.LocationsListFeature.target(.tests)
}