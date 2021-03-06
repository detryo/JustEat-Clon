//
//  Order.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 17/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

struct Order: Codable, Hashable {
    var cupcake : Product
    var topping : Set<Product>
    
    var name : String {
        if topping.count == 0 {
            return cupcake.name
        }else {
            let toppingNames = topping.map {
                $0.name.lowercased()
            }
            return "\(cupcake.name) with \(toppingNames.joined(separator: ", "))."
        }
    }
    
    var price : Int{
        return topping.reduce(cupcake.price) { $0 + $1.price}
        
    }
}
extension Order {
    init?(from data : Data?) {
        guard let data = data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let saveOrder = try? decoder.decode(Order.self, from: data) else {
            return nil
        }
        cupcake = saveOrder.cupcake
        topping = saveOrder.topping
    }
}
