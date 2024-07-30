import ProjectDescription

extension TargetDependency {
    public static let MoveDetailFeature: TargetDependency = Feature.MoveDetailFeature.target(.implementation)
    public static let MoveDetailFeatureExampleApp: TargetDependency = Feature.MoveDetailFeature.target(.exampleApp)
    public static let MoveDetailFeatureTests: TargetDependency = Feature.MoveDetailFeature.target(.tests)
}