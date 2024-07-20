// Tuist/ProjectDescriptionHelpers/Module/Target+Templates.swift
import ProjectDescription

extension Target {
    public static func moduleTarget(
        module: Module,
        targetType: TargetType,
        destinations: Destinations = .iOS,
        infoPlist: InfoPlist = .default,
        productName: String? = nil,
        includeResources: Bool = false,
        deploymentTargets: DeploymentTargets? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Entitlements? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: Settings = .moduleSettings(),
        coreDataModels: [CoreDataModel] = [],
        environmentVariables: [String: EnvironmentVariable] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = [],
        buildRules: [BuildRule] = [],
        mergedBinaryType: MergedBinaryType = .disabled,
        mergeable: Bool = false,
        onDemandResourcesTags: OnDemandResourcesTags? = nil
    ) -> Target {
        return .target(
            name: module.name(targetType),
            destinations: destinations,
            product: targetType.product,
            productName: productName,
            bundleId: module.bundleId(targetType),
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: module.sources(targetType),
            resources: includeResources ? module.resources(targetType) : nil,
            copyFiles: copyFiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings,
            coreDataModels: coreDataModels,
            environmentVariables: environmentVariables,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles,
            buildRules: buildRules,
            mergedBinaryType: mergedBinaryType,
            mergeable: mergeable,
            onDemandResourcesTags: onDemandResourcesTags
        )
    }
}