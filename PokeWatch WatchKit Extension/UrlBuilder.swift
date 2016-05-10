//
//  UrlBuilder.swift
//  PokeWatch
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import Foundation

class UrlBuilder {
    private static let BASE_URL = "http://pokeapi.co/api/v2/"
    private static let POKEMON_LIST = "pokedex/1/"
    private static let POKEMON = "pokemon/"
    
    static func getPokemonListURL() -> String {
        return BASE_URL + POKEMON_LIST
    }
    
    static func getPokemonUrl(pokeName:String) -> String {
        return BASE_URL + POKEMON + pokeName + "/"
    }
}
