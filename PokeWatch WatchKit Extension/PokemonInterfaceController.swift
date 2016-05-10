//
//  PokemonInterfaceController.swift
//  PokeWatch
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import WatchKit
import Foundation


class PokemonInterfaceController: WKInterfaceController {

    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var spriteImageView: WKInterfaceImage!
    @IBOutlet var typeLabel: WKInterfaceLabel!
    
    private var pokemon:Pokemon? {
        didSet {
            if let pokemonNotNil = pokemon {
                nameLabel.setText(pokemonNotNil.name)
                
                if let checkedUrl = NSURL(string: pokemonNotNil.image) {
                    downloadImage(checkedUrl)
                }
                
                var types = ""
                for index in 0..<pokemonNotNil.types.count {
                    types += pokemonNotNil.types[index] + " "
                }
                typeLabel.setText(types)
            }
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let pokeName = context as? String {
            NetworkManager.getPokemon(pokeName, completionHandler: { (pokemon) in
                self.pokemon = pokemon
            })
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL){
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.spriteImageView.setImage(UIImage(data: data))
            }
        }
    }

}
