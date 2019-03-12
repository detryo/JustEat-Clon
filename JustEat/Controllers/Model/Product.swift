//
//  Product.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 11/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

struct Product : Codable, Hashable{
    var name : String
    var description : String
    var price : Int
}
