import ProjectDescription

let project = Project(
    name: "Pokedex",
    targets: [
        .target(
            name: "Pokedex",
            destinations: .iOS,
            product: .app,
            bundleId: "com.swiftly.andy.Pokedex",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
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
