import ProjectDescription
import ProjectDescriptionHelpers

let feature = Feature.RegionListFeature

let project: Project = .moduleProject(
    module: feature,
    targets: [
        .moduleTarget(
            module: feature,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .PokemonRepoInterface,
                .Models
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .exampleApp,
            infoPlist: .exampleAppInfoPlist,
            dependencies: [
                .RegionListFeature,
                .ComposableArchitecture
            ]
        ),
        .moduleTarget(
            module: feature,
            targetType: .tests,
            dependencies: [
                .RegionListFeature
            ]
        )
    ]
)
