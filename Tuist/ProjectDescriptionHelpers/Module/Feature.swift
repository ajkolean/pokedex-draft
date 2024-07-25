// Tuist/ProjectDescriptionHelpers/Module/Feature.swift
import Foundation

public enum Feature: String, CaseIterable, Module {
    case AppFeature
    case PokemonListFeature
    case PokemonDetailFeature
    case TypeListFeature
    case TypeDetailFeature
    
    public var type: ModuleType { .feature }
}

