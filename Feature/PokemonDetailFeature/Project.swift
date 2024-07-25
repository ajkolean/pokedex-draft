import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.PokemonDetailFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .Models,
                .Kingfisher,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .PokemonDetailFeature,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .PokemonDetailFeature,
            ]
        ),
    ]
)
