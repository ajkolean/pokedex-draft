import ProjectDescription

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
            environmentVariables: envVar()
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

func envVar() -> [String: EnvironmentVariable] {
    if case let .string(tcgApiKey) = Environment.tcgApiKey {
        ["TUIST_TCG_API_KEY": .environmentVariable(value: tcgApiKey, isEnabled: true)]
    } else {
        [:]
    }
}
