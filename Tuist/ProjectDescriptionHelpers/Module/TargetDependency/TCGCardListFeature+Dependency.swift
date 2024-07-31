import ProjectDescription

extension TargetDependency {
    public static let TCGCardListFeature: TargetDependency = Feature.TCGCardListFeature.target(.implementation)
    public static let TCGCardListFeatureExampleApp: TargetDependency = Feature.TCGCardListFeature.target(.exampleApp)
    public static let TCGCardListFeatureTests: TargetDependency = Feature.TCGCardListFeature.target(.tests)
}