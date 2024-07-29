import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.PokemonDataStoreClient

let project: Project = .moduleProject(
    module: foundation,
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .Models,
                .PokemonDataStoreClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            dependencies: [
                .ComposableArchitecture,
                .Models,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .tests,
            dependencies: [
                .PokemonDataStoreClient,
            ]
        ),
    ]
)
