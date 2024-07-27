// swift-tools-version: 5.10
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [
            "ComposableArchitecture": .framework,
            "Kingfisher": .framework
        ]
    )
#endif

let package = Package(
    name: "Pokedex",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.11.2"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.12.0"),
        .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.14.0"),
        .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.5.0")

        
    ]
)
