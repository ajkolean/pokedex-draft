// Tuist/ProjectDescriptionHelpers/Module/Feature.swift
import Foundation

public enum Feature: String, CaseIterable, Module {
    case AppFeature
    case PokemonListFeature
    case PokemonDetailFeature
    case TypeListFeature
    case TypeDetailFeature
    case ItemListFeature
    case RegionListFeature
    case LocationsListFeature
    case MovesListFeature
    case MoveDetailFeature
    case TCGSetListFeature
    case TCGCardListFeature
    case TCGCardDetailFeature

    public var type: ModuleType { .feature }
}

