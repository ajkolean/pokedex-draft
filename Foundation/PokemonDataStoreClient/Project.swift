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
                .Models,
                .external(name: "SQLite"),
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            infoPlist: .default,
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
