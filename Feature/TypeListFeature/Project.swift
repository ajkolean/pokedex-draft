import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.TypeListFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .ModelsImplementation,
                .PokemonRepoInterface,
                .PokemonRepoImplementation,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .TypeListFeatureImplementation,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .TypeListFeatureImplementation,
            ]
        ),
    ]
)
