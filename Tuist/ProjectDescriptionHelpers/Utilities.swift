// Tuist/ProjectDescriptionHelpers/Module/Utilities.swift
import ProjectDescription

public enum Constants {
    static let bundlePrefix = "com.swiftly.andy."
    static let organizationName = "SwiftlyAndy"
}

extension String {
    public var capitalizeFirstLetter: String {
        prefix(1).capitalized + dropFirst()
    }
}
