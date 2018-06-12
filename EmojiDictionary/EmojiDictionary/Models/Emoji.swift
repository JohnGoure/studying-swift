//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by john goure on 5/21/18.
//  Copyright © 2018 john goure. All rights reserved.
//

import Foundation

class Emoji: Codable {
    let symbol: String
    let name: String
    let detailDescription: String
    let usage: String
    
    init(_ symbol: String, _ name: String, _ description: String, _ usage: String) {
        self.symbol = symbol
        self.name = name
        self.detailDescription = description
        self.usage = usage
    }
    
    
    
    
}
