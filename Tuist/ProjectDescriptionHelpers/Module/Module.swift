// Tuist/ProjectDescriptionHelpers/Module/Module.swift
import ProjectDescription

public let allProjectPaths = Feature.allCases.map { $0.path } + Foundation.allCases.map { $0.path }

public enum ModuleType: String {
    case foundation = "Foundation"
    case feature = "Feature"
}

public protocol Module {
    var rawValue: String { get }
    var type: ModuleType { get }
    var name: String { get }
    var path: Path { get }
    func name(_ target: TargetType) -> String
    func target(_ target: TargetType) -> TargetDependency
    func bundleId(_ target: TargetType) -> String
}

extension Module {
    public var name: String { rawValue.capitalizeFirstLetter }
    
    public var path: Path { .relativeToRoot("\(type.rawValue)/\(name)") }
    
    public func name(_ target: TargetType) -> String {
        switch target {
        case .implementation, .interface, .exampleApp, .testSupport, .tests:
            return name + target.name
        case .custom(let targetName, _):
            return targetName
        }
    }
    
    public func target(_ target: TargetType) -> TargetDependency {
        .project(target: name(target), path: path)
    }
    
    public func bundleId(_ target: TargetType) -> String {
        Constants.bundlePrefix + name(target)
    }
    
    public func sources(_ target: TargetType) -> SourceFilesList {
        ["Sources/\(name(target))/**"]
    }
    
    public func resources(_ target: TargetType) -> ResourceFileElements {
        ["Sources/\(name(target))/Resources/**"]
    }
}
