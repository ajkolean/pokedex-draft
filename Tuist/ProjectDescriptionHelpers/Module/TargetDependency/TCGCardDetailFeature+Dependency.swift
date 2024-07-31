import ProjectDescription

extension TargetDependency {
    public static let TCGCardDetailFeature: TargetDependency = Feature.TCGCardDetailFeature.target(.implementation)
    public static let TCGCardDetailFeatureExampleApp: TargetDependency = Feature.TCGCardDetailFeature.target(.exampleApp)
    public static let TCGCardDetailFeatureTests: TargetDependency = Feature.TCGCardDetailFeature.target(.tests)
}