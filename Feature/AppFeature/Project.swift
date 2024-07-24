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
                .PokemonListFeatureImplementation,
                .ModelsImplementation,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .AppFeatureImplementation,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .AppFeatureImplementation,
            ]
        ),
    ]
)
