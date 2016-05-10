//
//  Pokemon.swift
//  PokeWatch
//
//  Created by student5306 on 18/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import Foundation
import SwiftyJSON

class Pokemon {
    
    struct Constants {
        static let NAME = "name"
        static let SPRITE = "sprites"
        static let SPRITE_TYPE = "front_default"
        static let TYPES = "types"
        static let TYPE = "type"
    }
    
    var name:String!
    var image:String!
    var types:[String]!
    
    init(json:JSON) {
        name = json[Constants.NAME].stringValue
        image = json[Constants.SPRITE][Constants.SPRITE_TYPE].stringValue
        types = [String]()
        for type in json[Constants.TYPES].arrayValue {
            types.append(type[Constants.TYPE][Constants.NAME].stringValue)
        }
    }
    
}
