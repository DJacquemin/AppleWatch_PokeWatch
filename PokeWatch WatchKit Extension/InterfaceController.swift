//
//  InterfaceController.swift
//  PokeWatch WatchKit Extension
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    private let POKEMON_SEGUE_IDENTIFIER = "pokemon_segue_identifier"
    
    @IBOutlet var pokeList: WKInterfaceTable!
    
    private var pokeNames = [String]()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        NetworkManager.getPokemons({ (pokemons) in
            self.pokeNames = pokemons
            
            self.pokeList.setNumberOfRows(self.pokeNames.count, withRowType: PokeRow.identifier)
            
            for index in 0..<self.pokeNames.count {
                let pokeName = self.pokeNames[index]
                
                if let pokeRow = self.pokeList.rowControllerAtIndex(index) as? PokeRow {
                    pokeRow.pokeName = pokeName
                }
            }
        })
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let pokeName = pokeNames[rowIndex]
        return pokeName
    }

}
