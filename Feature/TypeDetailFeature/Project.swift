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
                .PokemonRepoInterface,
                .PokemonRepoImplementation,
                .Kingfisher,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .TypeDetailFeature,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .TypeDetailFeature,
            ]
        ),
    ]
)
