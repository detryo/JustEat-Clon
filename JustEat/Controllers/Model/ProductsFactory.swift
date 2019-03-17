//
//  ProductFactory.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 11/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

class ProductsFactory {
    var cupcakes = [Product]()
    var topping = [Product]()
    
    private static var sharedFactory : ProductsFactory = {
        let factory = ProductsFactory()
        return factory
    }()
    
    private init() {
       cupcakes = loadProduct(name: "cupcakes")
       topping = loadProduct(name: "toppings")
    }
    
    private func loadProduct(name : String) -> [Product] {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            fatalError("error")
        }
        var tempProducts = [Product]()
        
        if let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            tempProducts = (try? decoder.decode([Product].self, from: data)) ?? [Product]()
            tempProducts.sort{
                return $0.name < $1.name
            }
        }
        return tempProducts
    }
    
    class func shared() -> ProductsFactory {
        return sharedFactory
    }
}
