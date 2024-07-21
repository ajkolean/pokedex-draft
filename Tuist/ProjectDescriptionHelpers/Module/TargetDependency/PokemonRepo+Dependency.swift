import ProjectDescription

extension TargetDependency {
    public static let PokemonRepoImplementation: TargetDependency = Foundation.PokemonRepo.target(.implementation)
    public static let PokemonRepoInterface: TargetDependency = Foundation.PokemonRepo.target(.interface)
    public static let PokemonRepoTestSupport: TargetDependency = Foundation.PokemonRepo.target(.testSupport)
    public static let PokemonRepoTests: TargetDependency = Foundation.PokemonRepo.target(.tests)

}