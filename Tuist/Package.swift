// swift-tools-version: 5.10
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: ["ComposableArchitecture": .framework]
    )
#endif

let package = Package(
    name: "Pokedex",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.11.2"),
    ]
)
