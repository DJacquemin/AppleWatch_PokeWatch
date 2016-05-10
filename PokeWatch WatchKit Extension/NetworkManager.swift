//
//  NetworkManager.swift
//  PokeWatch
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    internal static func getPokemons(completionHandler:(pokemons:[String]) -> Void) {
        var pokemons = [String]()
        let url = UrlBuilder.getPokemonListURL()
        Alamofire.request(.GET, url, encoding: .JSON).responseJSON { response -> Void in
            pokemons = JsonParser.parseJSONForPokemonList(response.data)
            completionHandler(pokemons: pokemons)
        }
    }
    
    internal static func getPokemon(pokeName:String, completionHandler:(pokemon:Pokemon?) -> Void) {
        var pokemon:Pokemon?
        let url = UrlBuilder.getPokemonUrl(pokeName)
        Alamofire.request(.GET, url, encoding: .JSON).responseJSON { reponse -> Void in
            pokemon = JsonParser.parseJSONForPokemon(reponse.data)
            completionHandler(pokemon: pokemon)
        }
    }
}
