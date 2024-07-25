// Tuist/ProjectDescriptionHelpers/Module/TargetDependency/AppFeature+Dependency.swift
import ProjectDescription

extension TargetDependency {
    public static let AppFeature: TargetDependency = Feature.AppFeature.target(.implementation)
    public static let AppFeatureExampleApp: TargetDependency = Feature.AppFeature.target(.exampleApp)
    public static let AppFeatureTests: TargetDependency = Feature.AppFeature.target(.tests)
}
