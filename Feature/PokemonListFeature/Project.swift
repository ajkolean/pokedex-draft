// Feature/PokemonListFeature/Project.swift
import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.PokemonListFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .ModelsImplementation,
                .PokemonAPIClientImplementation,
                .PokemonAPIClientInterface
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .PokemonListFeatureImplementation,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .PokemonListFeatureImplementation,
            ]
        ),
    ]
)
