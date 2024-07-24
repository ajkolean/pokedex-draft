import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.PokemonTypeListFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .PokemonTypeListFeatureImplementation,
                .ComposableArchitecture
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .PokemonTypeListFeatureImplementation
            ]
        )
    ]
)