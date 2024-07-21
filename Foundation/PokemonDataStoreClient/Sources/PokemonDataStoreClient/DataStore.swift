import Foundation
import Models
import UIKit

public class DataStore {
    private var pokemons: [String: PokemonDetails] = [:]
    private var pokemonIdentifiers: [PokemonIdentifier] = []
    private let pokemonsFileName = "pokemonDetails_sd.json"
    private let pokemonIdentifiersFileName = "pokemon_identifiers.json"
    private let saveQueue = DispatchQueue(label: "com.example.DataStore.saveQueue", qos: .background)
    private var saveWorkItem: DispatchWorkItem?

    private let queue = DispatchQueue(label: "com.example.DataStore.queue", attributes: .concurrent)

    public init() {
        createFileIfNeeded(fileName: pokemonsFileName, initialData: [PokemonDetails]())
        createFileIfNeeded(fileName: pokemonIdentifiersFileName, initialData: [PokemonIdentifier]())
        loadPokemons()
        loadPokemonIdentifiers()

        NotificationCenter.default.addObserver(
            forName: UIApplication.willResignActiveNotification,
            object: nil,
            queue: nil
        ) { [weak self] _ in
            self?.handleWillResignActive()
        }
    }

    public func fetchPokemonIdentifiers() -> [PokemonIdentifier] {
        return queue.sync {
            return pokemonIdentifiers
        }
    }

    public func savePokemonIdentifiers(_ pokemonIdentifiers: [PokemonIdentifier]) {
        queue.async(flags: .barrier) {
            self.pokemonIdentifiers = pokemonIdentifiers
            self.debounceSaveData(data: pokemonIdentifiers, fileName: self.pokemonIdentifiersFileName)
        }
    }

    public func savePokemon(_ pokemon: PokemonDetails) {
        queue.async(flags: .barrier) {
            self.pokemons[pokemon.name] = pokemon
            self.debounceSaveData(data: Array(self.pokemons.values), fileName: self.pokemonsFileName)
        }
    }

    public func fetchPokemon(_ name: String) -> PokemonDetails? {
        return queue.sync {
            return pokemons[name]
        }
    }

    private func debounceSaveData(data: some Encodable, fileName: String) {
        saveWorkItem?.cancel()

        let workItem = DispatchWorkItem { [weak self] in
            guard let self else { return }
            saveToFile(data: data, fileName: fileName)
        }

        saveWorkItem = workItem
        saveQueue.asyncAfter(deadline: .now() + 5, execute: workItem)
    }

    private func handleWillResignActive() {
        guard let saveWorkItem else { return }
        saveQueue.async {
            saveWorkItem.perform()
            self.saveWorkItem?.cancel()
            self.saveWorkItem = nil
        }
    }

    private func saveToFile(data: some Encodable, fileName: String) {
        do {
            let encodedData = try JSONEncoder().encode(data)
            let url = getDocumentsDirectory().appendingPathComponent(fileName)
            try encodedData.write(to: url)
        } catch {
            print("Failed to save data to \(fileName): \(error)")
        }
    }

    private func loadFromFile<T: Decodable>(fileName: String) -> T? {
        do {
            let url = getDocumentsDirectory().appendingPathComponent(fileName)
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Failed to load data from \(fileName): \(error)")
            return nil
        }
    }

    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    private func createFileIfNeeded(fileName: String, initialData: some Encodable) {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                let encodedData = try JSONEncoder().encode(initialData)
                FileManager.default.createFile(atPath: url.path, contents: encodedData, attributes: nil)
            } catch {
                print("Failed to create file \(fileName): \(error)")
            }
        }
    }

    private func loadPokemons() {
        queue.async(flags: .barrier) {
            guard let loadedPokemons: [PokemonDetails] = self.loadFromFile(fileName: self.pokemonsFileName) else { return }
            self.pokemons = Dictionary(uniqueKeysWithValues: loadedPokemons.map { ($0.name, $0) })
        }
    }

    private func loadPokemonIdentifiers() {
        queue.async(flags: .barrier) {
            guard let loadedPokemonIdentifiers: [PokemonIdentifier] = self
                .loadFromFile(fileName: self.pokemonIdentifiersFileName) else { return }
            self.pokemonIdentifiers = loadedPokemonIdentifiers
        }
    }
}

extension DataStore {
    public static let shared: DataStore = .init()

    public static let test: DataStore = {
        let dataStore = DataStore()
        // Pokemon.mockData.forEach { try? dataStore.savePokemon($0) }
        return dataStore
    }()
}
