import ProjectDescription

extension TargetDependency {
    public static let ModelsImplementation: TargetDependency = Foundation.Models.target(.implementation)
    public static let ModelsInterface: TargetDependency = Foundation.Models.target(.interface)
    public static let ModelsTestSupport: TargetDependency = Foundation.Models.target(.testSupport)
    public static let ModelsTests: TargetDependency = Foundation.Models.target(.tests)

}