import Foundation

import SwiftData

public class ModelContainerProvider {
    public static let shared: ModelContainerProvider = .init(isTest: false)

    public static let test: ModelContainerProvider = .init(isTest: true)

    public let container: ModelContainer

    private init(isTest: Bool) {
        do {
            let config: ModelConfiguration
            if isTest {
                config = ModelConfiguration(isStoredInMemoryOnly: true, cloudKitDatabase: .none)
            } else {
                let storeURL = URL.documentsDirectory.appending(path: "database_typsddb1.sqlite")
                print(storeURL)
                config = ModelConfiguration(url: storeURL, cloudKitDatabase: .none)
            }
            container = try ModelContainer(
                for: PokemonEntity.self,
                PokemonSummaryEntity.self,
                PokemonTypeEntity.self,
                ItemCategoryEntity.self,
                RegionEntity.self,
                LocationEntity.self,
                LocationAreaEntity.self,
                configurations: config
            )
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
}
