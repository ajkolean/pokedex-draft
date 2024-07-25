import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.PokemonAPIClient

let project: Project = .moduleProject(
    module: foundation,
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            dependencies: [
                .PokemonAPIClientInterface,
                .ModelsImplementation,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            infoPlist: .default,
            dependencies: [
                .ModelsImplementation,
                .ComposableArchitecture,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .tests,
            dependencies: [
                .PokemonAPIClientImplementation,
            ]
        ),
    ]
)
