import Foundation
import UIKit

struct Pokemon: Codable {
    let name: String
    let height: Double
    let sprites: Sprites
}

struct Sprites: Codable {
    let frontDefault: URL
}

func fetchRandomPokemon() async throws -> (Pokemon, UIImage?)  {
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    let number = Int.random(in: 1...700)
    let urlRequest = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)")!)
    let (data, _) = try await URLSession.shared.data(for: urlRequest)
    let pokemon = try! decoder.decode(Pokemon.self, from: data)
    let (imageData, _) = try await URLSession.shared.data(for: URLRequest(url: pokemon.sprites.frontDefault))
    let pokemonImage = UIImage(data: imageData)
    
    return (pokemon, pokemonImage)
}
