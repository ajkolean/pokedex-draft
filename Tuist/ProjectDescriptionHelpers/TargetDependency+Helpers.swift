// Tuist/ProjectDescriptionHelpers/Module/TargetDependency+Helpers.swift
import ProjectDescription

extension TargetDependency {
    public static let ComposableArchitecture: TargetDependency = .external(name: "ComposableArchitecture")
    public static let Kingfisher: TargetDependency = .external(name: "Kingfisher")
}
