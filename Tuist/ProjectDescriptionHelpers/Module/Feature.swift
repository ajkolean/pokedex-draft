// Tuist/ProjectDescriptionHelpers/Module/Feature.swift
import Foundation

public enum Feature: String, CaseIterable, Module {
    case AppFeature
    case PokemonListFeature
    case PokemonDetailFeature
    case TypeListFeature
    
    public var type: ModuleType { .feature }
}

