// Tuist/ProjectDescriptionHelpers/Module/TargetType.swift
import ProjectDescription

public enum TargetType {
    case implementation
    case interface
    case exampleApp
    case testSupport
    case tests
    case custom(name: String, product: Product)
}

extension TargetType {
    public static let featureTypes: [TargetType] = [
        .implementation,
        .exampleApp,
        .tests
    ]
    
    public static let foundationTypes: [TargetType] = [
        .implementation,
        .interface,
        .testSupport,
        .tests
    ]
    
    public var name: String {
        switch self {
        case .implementation:
            return ""
        case .interface:
            return "Interface"
        case .exampleApp:
            return "ExampleApp"
        case .testSupport:
            return "TestSupport"
        case .tests:
            return "Tests"
        case .custom(let name, _):
            return name
        }
    }
    
    public var product: Product {
        switch self {
        case .implementation:
            return .framework
        case .interface:
            return .framework
        case .exampleApp:
            return .app
        case .testSupport:
            return .framework
        case .tests:
            return .unitTests
        case .custom(_, let product):
            return product
        }
    }
}
