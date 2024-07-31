import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.TCGCardListFeature

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
                .Kingfisher,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .TCGCardListFeature,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .TCGCardListFeature,
            ]
        ),
    ]
)
