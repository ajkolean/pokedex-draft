import ProjectDescription

extension TargetDependency {
    public static let TCGNetworkClient: TargetDependency = Foundation.TCGNetworkClient.target(.implementation)
    public static let TCGNetworkClientInterface: TargetDependency = Foundation.TCGNetworkClient.target(.interface)
    public static let TCGNetworkClientTests: TargetDependency = Foundation.TCGNetworkClient.target(.tests)

}