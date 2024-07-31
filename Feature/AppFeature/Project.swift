// Feature/AppFeature/Project.swift
import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.AppFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .Models,
                .TCGNetworkClient,
            ] + Feature.allCases.filter { $0 != .AppFeature }.map { $0.target(.implementation) }
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .AppFeature,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .AppFeature,
            ]
        ),
    ]
)
