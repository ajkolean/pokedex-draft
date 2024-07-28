import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.PokemonGraphClient

let project: Project = .moduleProject(
    module: foundation,
    packages: [
        //        .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.14.0")
    ],
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            dependencies: [
                .PokemonGraphClientInterface,
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .interface,
            dependencies: [
                //                .package(product: "InstallCLI", type: .plugin),
                .external(name: "Apollo"),
                .ComposableArchitecture,
                .Models,
                .external(name: "MemberwiseInit"),
            ]
        ),
        .moduleTarget(
            module: foundation,
            targetType: .tests,
            dependencies: [
                .PokemonGraphClient,
            ]
        ),
    ],
    additionalFiles: ["**/*.graphql"]
)
