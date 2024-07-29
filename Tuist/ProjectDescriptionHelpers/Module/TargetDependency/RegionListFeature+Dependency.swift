import ProjectDescription

extension TargetDependency {
    public static let RegionListFeature: TargetDependency = Feature.RegionListFeature.target(.implementation)
    public static let RegionListFeatureExampleApp: TargetDependency = Feature.RegionListFeature.target(.exampleApp)
    public static let RegionListFeatureTests: TargetDependency = Feature.RegionListFeature.target(.tests)
}