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
    
    private static var sharedFactory : ProductsFactory = {
        let factory = ProductsFactory()
        return factory
    }()
    
    init() {
        guard let url = Bundle.main.url(forResource: "cupcakes", withExtension: "json") else {
            fatalError("error with cupcakes json")
        }
        if let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            cupcakes = (try? decoder.decode([Product].self, from: data)) ?? [Product]()
            // Ordenar alfabeticamente
            cupcakes.sort {
                return $0.name < $1.name
            }
        }
    }
    
    class func shared() -> ProductsFactory {
        return sharedFactory
    }
}
