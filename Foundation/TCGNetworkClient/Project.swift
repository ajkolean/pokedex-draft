import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.TCGNetworkClient

let project: Project = .moduleProject(
    module: foundation,
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
                .TCGNetworkClientInterface,
                .Models,
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
                .TCGNetworkClient,
            ]
        ),
    ]
)

