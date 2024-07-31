// Tuist/ProjectDescriptionHelpers/Module/Foundation.swift
import Foundation

public enum Foundation: String, CaseIterable, Module {
    case Models
    case PokemonAPIClient
    case PokemonDataStoreClient
    case PokemonRepo
    case PokemonGraphClient
    case TCGNetworkClient
    
    public var type: ModuleType { .foundation }
}
