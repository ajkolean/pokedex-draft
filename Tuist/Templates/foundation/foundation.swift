// Tuist/Templates/feature/foundation.swift
import ProjectDescription
import ProjectDescriptionHelpers

private let nameAttribute: Template.Attribute = .required("name")

private let projectFile =
            """
            import ProjectDescription
            import ProjectDescriptionHelpers
            
            let foundation = Foundation.\(nameAttribute)
            
            let project: Project = .moduleProject(
                module: foundation,
                targets: [
                    .moduleTarget(
                        module: foundation,
                        targetType: .implementation,
                        dependencies: [
                            .\(nameAttribute)Interface
                        ]
                    ),
                    .moduleTarget(
                        module: foundation,
                        targetType: .interface,
                        infoPlist: .default,
                        dependencies: []
                    ),
                    .moduleTarget(
                        module: foundation,
                        targetType: .testSupport,
                        infoPlist: .default,
                        dependencies: [
                            .\(nameAttribute)Interface
                        ]
                    ),
                    .moduleTarget(
                        module: foundation,
                        targetType: .tests,
                        dependencies: [
                            .\(nameAttribute)Implementation
                        ]
                    )
                ]
            )
            """

private let dependencyFile =
            """
            import ProjectDescription
            
            extension TargetDependency {
                public static let \(nameAttribute)Implementation: TargetDependency = Foundation.\(nameAttribute).target(.implementation)
                public static let \(nameAttribute)Interface: TargetDependency = Foundation.\(nameAttribute).target(.interface)
                public static let \(nameAttribute)TestSupport: TargetDependency = Foundation.\(nameAttribute).target(.testSupport)
                public static let \(nameAttribute)Tests: TargetDependency = Foundation.\(nameAttribute).target(.tests)

            }
            """

private let targetItems: [Template.Item] = TargetType.foundationTypes.map { type in
        .file(
            path: "Foundation/\(nameAttribute)/Sources/\(nameAttribute)\(type.name)/\(nameAttribute)\(type.name).swift",
            templatePath: "stencils/Foundation\(type.name).stencil"
        )
}


let foundationTemplate = Template(
    description: "Template for a TCA Foundation setup",
    attributes: [
        nameAttribute
    ],
    items: [
        .string(
            path: "Foundation/\(nameAttribute)/Project.swift",
            contents: projectFile
        ),
        .string(
            path: "Tuist/ProjectDescriptionHelpers/Module/TargetDependency/\(nameAttribute)+Dependency.swift",
            contents: dependencyFile
        )
    ] + targetItems
)
