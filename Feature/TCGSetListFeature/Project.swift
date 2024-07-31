import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.TCGSetListFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .Models,
                .PokemonRepoImplementation,
                .PokemonRepoInterface,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .TCGSetListFeature,
                .ComposableArchitecture
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .TCGSetListFeature
            ]
        )
    ]
)
