// Tuist/ProjectDescriptionHelpers/Module/Feature.swift
import Foundation

public enum Feature: String, CaseIterable, Module {
    case AppFeature
    
    public var type: ModuleType { .feature }
}

