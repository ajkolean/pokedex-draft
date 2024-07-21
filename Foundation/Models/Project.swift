// Foundation/Models/Project.swift
import ProjectDescription
import ProjectDescriptionHelpers

let foundation = Foundation.Models

let project: Project = .moduleProject(
    module: foundation,
    targets: [
        .moduleTarget(
            module: foundation,
            targetType: .implementation,
            dependencies: [
                .ComposableArchitecture,
            ]
        ),
    ]
)
