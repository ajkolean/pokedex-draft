// Workspace.swift
import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "PokedexWorkspace",
    projects: ["App"] + allProjectPaths
)
