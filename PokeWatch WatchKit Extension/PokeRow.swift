//
//  PokeRow.swift
//  PokeWatch
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import Foundation
import WatchKit

class PokeRow: NSObject {
    
    @IBOutlet var nameLabel: WKInterfaceLabel!
    
    static let identifier = "pokeName"
    
    var pokeName: String! {
        didSet {
            nameLabel.setText(pokeName)
        }
    }
}
