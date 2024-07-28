import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.PokemonRepo

let project: Project = .moduleProject(
    module: foundation,
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            dependencies: [
                .PokemonRepoInterface,
                .ComposableArchitecture,
                .PokemonGraphClientInterface,
                .PokemonDataStoreClient,
                .PokemonDataStoreClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            dependencies: [
                .ComposableArchitecture,
                .PokemonGraphClientInterface,
                .PokemonDataStoreClient,
                .PokemonDataStoreClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .tests,
            dependencies: [
                .PokemonRepoImplementation,
            ]
        ),
    ]
)
