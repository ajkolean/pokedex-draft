// Tuist/Templates/feature/feature.swift
import ProjectDescription
import ProjectDescriptionHelpers

private let nameAttribute: Template.Attribute = .required("name")

private let projectFile =
            """
            import ProjectDescription
            import ProjectDescriptionHelpers
            
            let feature = Feature.\(nameAttribute)
            
            let project: Project = .moduleProject(
                module: feature,
                targets: [
                    .moduleTarget(
                        module: feature,
                        targetType: .implementation,
                        dependencies: [
                            .ComposableArchitecture
                        ]
                    ),
                    .moduleTarget(
                        module: feature,
                        targetType: .exampleApp,
                        infoPlist: .exampleAppInfoPlist,
                        dependencies: [
                            .\(nameAttribute),
                            .ComposableArchitecture
                        ]
                    ),
                    .moduleTarget(
                        module: feature,
                        targetType: .tests,
                        dependencies: [
                            .\(nameAttribute)
                        ]
                    )
                ]
            )
            """

private let dependencyFile =
            """
            import ProjectDescription
            
            extension TargetDependency {
                public static let \(nameAttribute): TargetDependency = Feature.\(nameAttribute).target(.implementation)
                public static let \(nameAttribute)ExampleApp: TargetDependency = Feature.\(nameAttribute).target(.exampleApp)
                public static let \(nameAttribute)Tests: TargetDependency = Feature.\(nameAttribute).target(.tests)
            }
            """

private let targetItems: [Template.Item] = TargetType.featureTypes.map { type in
        .file(
            path: "Feature/\(nameAttribute)/\(type.directory)/\(nameAttribute)\(type.name).swift",
            templatePath: "stencils/Feature\(type.name).stencil"
        )
}


let featureTemplate = Template(
    description: "Template for a TCA Feature setup",
    attributes: [
        nameAttribute
    ],
    items: [
        .string(
            path: "Feature/\(nameAttribute)/Project.swift",
            contents: projectFile
        ),
        .string(
            path: "Tuist/ProjectDescriptionHelpers/Module/TargetDependency/\(nameAttribute)+Dependency.swift",
            contents: dependencyFile
        )
    ] + targetItems
)
