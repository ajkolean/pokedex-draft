// Tuist/ProjectDescriptionHelpers/Module/Project+Templates.swift
import ProjectDescription

extension Project {
    public static func moduleProject(
        module: Module,
        options: Project.Options = .options(),
        packages: [Package] = [],
        settings: Settings? = .moduleSettings(),
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

extension Settings {
    public static func moduleSettings() -> Self {
        .settings(
            base: [
                "ONLY_ACTIVE_ARCH": "YES",
                "EXCLUDED_ARCHS[sdk=iphonesimulator*]": "arm64",
                "OTHER_LDFLAGS": "$(inherited) -ObjC"
            ]
        )
        
    }
}
