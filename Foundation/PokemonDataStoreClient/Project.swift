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
                .PokemonDataStoreClientInterface,
                .ComposableArchitecture,
                .PokemonGraphClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            dependencies: [
                .ComposableArchitecture,
                .PokemonGraphClientInterface,
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
