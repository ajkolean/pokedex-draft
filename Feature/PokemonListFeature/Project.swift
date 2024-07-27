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
                .Models,
                .PokemonRepoInterface,
                .PokemonRepoImplementation,
                .PokemonAPIClient,
                .PokemonAPIClientInterface,
                .Kingfisher,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .PokemonListFeature,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .PokemonListFeature,
            ]
        ),
    ]
)
