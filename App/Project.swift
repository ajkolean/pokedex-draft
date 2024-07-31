import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Pokedex",
    targets: [
        .target(
            name: "Pokedex",
            destinations: .iOS,
            product: .app,
            bundleId: "com.swiftly.andy.Pokedex",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "AppFeature", path: .relativeToRoot("Feature/AppFeature")),
            ],
            environmentVariables: ["TCG_API_KEY": .environmentVariable(value: Environment.tcgApiKey.getString(default: ""),
                                                                       isEnabled: true)]
        ),
        .target(
            name: "PokedexTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "come.swiftly.andy.PokedexTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "Pokedex")]
        ),
    ]
)
