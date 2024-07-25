import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.TypeDetailFeature

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
                .PokemonDetailFeatureImplementation,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .TypeDetailFeatureImplementation,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .TypeDetailFeatureImplementation,
            ]
        ),
    ]
)
