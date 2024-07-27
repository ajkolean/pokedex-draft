// Tuist/ProjectDescriptionHelpers/Module/Project+Templates.swift
import ProjectDescription

extension Project {
    public static func moduleProject(
        module: Module,
        options: Project.Options = .options(),
        packages: [Package] = [],
        settings: Settings? = .settings(base: ["SWIFT_STRICT_CONCURRENCY": "complete"]),
        targets: [Target] = [],
        schemes: [Scheme] = [],
        fileHeaderTemplate: FileHeaderTemplate? = nil,
        additionalFiles: [FileElement] = [],
        resourceSynthesizers: [ResourceSynthesizer] = .default
    ) -> Project {
        return .init(
            name: module.name,
            organizationName: Constants.organizationName,
            options: options,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes,
            fileHeaderTemplate: fileHeaderTemplate,
            additionalFiles: additionalFiles,
            resourceSynthesizers: resourceSynthesizers
        )
        
    }
}

extension InfoPlist {
    public static let exampleAppInfoPlist: InfoPlist = .extendingDefault(
        with: [
            "UILaunchScreen": [
                "UIColorName": "",
                "UIImageName": "",
            ],
        ]
    )
}
