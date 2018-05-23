//
//  Meal.swift
//  Meal Tracker
//
//  Created by john goure on 5/22/18.
//  Copyright © 2018 john goure. All rights reserved.
//

import Foundation


class Meal {
    var name: String
    var food = [Food]()
    
    init(_ name: String) {
        self.name = name
    }
}
