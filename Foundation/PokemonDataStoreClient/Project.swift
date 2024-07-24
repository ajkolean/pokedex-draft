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
                .ModelsImplementation,
                .external(name: "SQLite"),
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            infoPlist: .default,
            dependencies: [
                .ComposableArchitecture,
                .ModelsImplementation,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .testSupport,
            infoPlist: .default,
            dependencies: [
                .PokemonDataStoreClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .tests,
            dependencies: [
                .PokemonDataStoreClientImplementation,
            ]
        ),
    ]
)
