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
                .ModelsImplementation,
                .PokemonAPIClientImplementation,
                .PokemonAPIClientInterface,
                .PokemonDataStoreClientImplementation,
                .PokemonDataStoreClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            infoPlist: .default,
            dependencies: [
                .ComposableArchitecture,
                .ModelsImplementation,
                .PokemonAPIClientImplementation,
                .PokemonAPIClientInterface,
                .PokemonDataStoreClientImplementation,
                .PokemonDataStoreClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .testSupport,
            infoPlist: .default,
            dependencies: [
                .PokemonRepoInterface,
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
