import Foundation
import Models

public class DataStore {
    private var pokemons: [Int: PokemonDetails] = [:]
    private var pokemonShorts: [PokemonIdentifier] = []
    private let pokemonsFileName = "pokemons.json"
    private let pokemoneIdentifiersFileName = "pokemon_identifiers.json"
    private let saveQueue = DispatchQueue(label: "com.example.DataStore.saveQueue", qos: .background)
    private var saveWorkItem: DispatchWorkItem?
    
    public init() {
        createFileIfNeeded(fileName: pokemonsFileName)
        createFileIfNeeded(fileName: pokemoneIdentifiersFileName)
        loadPokemons()
        loadPokemonShorts()
    }
    
    public func fetchPokemonIdentifiers() throws -> [PokemonIdentifier] {
        pokemonShorts
    }
    
    public func savePokemonIdentifiers(_ pokemonShorts: [PokemonIdentifier]) throws {
        self.pokemonShorts = pokemonShorts
        savePokemonShorts()
    }
    
    public func savePokemon(_ pokemon: PokemonDetails) throws {
        pokemons[pokemon.id] = pokemon
        debounceSavePokemons()
    }
    
    public func fetchPokemon(_ id: Int) throws -> PokemonDetails {
        guard let pokemon = pokemons[id] else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Pokemon not found"])
        }
        return pokemon
    }
    
    private func debounceSavePokemons() {
        saveWorkItem?.cancel()
        
        let workItem = DispatchWorkItem { [weak self] in
            self?.savePokemons()
        }
        
        saveWorkItem = workItem
        saveQueue.asyncAfter(deadline: .now() + 1, execute: workItem)
    }
    
    private func savePokemons() {
        saveToFile(data: Array(pokemons.values), fileName: pokemonsFileName)
    }
    
    private func savePokemonShorts() {
        saveToFile(data: pokemonShorts, fileName: pokemoneIdentifiersFileName)
    }
    
    private func loadPokemonShorts() {
        if let loadedPokemonShorts: [PokemonIdentifier] = loadFromFile(fileName: pokemoneIdentifiersFileName) {
            pokemonShorts = loadedPokemonShorts
        }
    }
    
    private func loadPokemons() {
        if let loadedPokemons: [PokemonDetails] = loadFromFile(fileName: pokemonsFileName) {
            for pokemon in loadedPokemons {
                pokemons[pokemon.id] = pokemon
            }
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
    
    private func createFileIfNeeded(fileName: String) {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        if !FileManager.default.fileExists(atPath: url.path) {
            FileManager.default.createFile(atPath: url.path, contents: nil, attributes: nil)
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
