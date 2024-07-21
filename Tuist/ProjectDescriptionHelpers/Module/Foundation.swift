// Tuist/ProjectDescriptionHelpers/Module/Foundation.swift
import Foundation

public enum Foundation: String, CaseIterable, Module {
    case Models
    case PokemonAPIClient
    
    public var type: ModuleType { .foundation }
}
