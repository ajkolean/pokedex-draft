import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.Models

let project: Project = .moduleProject(
    module: foundation,
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            includeResources: true,
            dependencies: [
                .external(name: "MemberwiseInit"),
                // remove me
                .Kingfisher,
            ]
        ),
    ]
)
