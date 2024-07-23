import Foundation
import SwiftData
import Models

public class ModelContainerProvider {
    public static let shared: ModelContainerProvider = {
        return ModelContainerProvider(isTest: false)
    }()
    
    public static let test: ModelContainerProvider = {
        return ModelContainerProvider(isTest: true)
    }()
    
    public let container: ModelContainer
    
    private init(isTest: Bool) {
        do {
            let config: ModelConfiguration
            if isTest {
                config = ModelConfiguration(isStoredInMemoryOnly: true, cloudKitDatabase: .none)
            } else {
                let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
                print(storeURL)
                config = ModelConfiguration(url: storeURL, cloudKitDatabase: .none)
            }
            container = try ModelContainer(for: PokemonEntity.self, PokemonIdentifierEntity.self, PokemonDetailsEntity.self, PokemonSpeciesEntity.self, configurations: config)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
}
