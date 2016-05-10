//
//  JsonParser.swift
//  PokeWatch
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonParser {
    
    private static let POKEMON_ENTRIES = "pokemon_entries"
    private static let POKEMON_SPECIES = "pokemon_species"
    private static let POKEMON_NAME = "name"
    
    internal static func parseJSONForPokemonList(data:NSData?) -> [String] {
        var pokemons = [String]()
        if let datas = data {
            let jsonData = JSON(data: datas)[POKEMON_ENTRIES].arrayValue
            
            for jsonPokeName in jsonData {
                pokemons.append(jsonPokeName[POKEMON_SPECIES][POKEMON_NAME].stringValue)
            }
        }
        return pokemons
    }
    
    internal static func parseJSONForPokemon(data:NSData?) -> Pokemon? {
        var pokemon:Pokemon?
        if let datas = data {
            let jsonData = JSON(data: datas)
            pokemon = Pokemon(json: jsonData)
        }
        return pokemon
    }
}
