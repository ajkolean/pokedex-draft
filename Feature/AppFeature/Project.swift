import ProjectDescription

let project = Project(
    name: "AppFeature",
    organizationName: "com.swiftly.andy",
    targets: [
        .target(
            name: "AppFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.swiftly.andy.PokedexAppFeature",
            infoPlist: .default,
            sources: ["Sources/AppFeature/**"],
            dependencies: []
        ),
        .target(
            name: "AppFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.yourorganization.AppFeatureTests",
            infoPlist: .default,
            sources: ["Sources/AppFeatureTests/**"],
            dependencies: [
                .target(name: "AppFeature"),
            ]
        ),
        .target(
            name: "AppFeatureExampleApp",
            destinations: .iOS,
            product: .app,
            bundleId: "com.swiftly.andy.PokedexAppFeatureExampleApp",
            infoPlist: .default,
            sources: ["Sources/AppFeatureExampleApp/**"],
            dependencies: [
                .target(name: "AppFeature"),
            ]
        )
    ]
)
