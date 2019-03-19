//
//  OrderViewController.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 6/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    var cupcake : Product!
    var toppings = Set<Product>()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let order = Order(cupcake: cupcake, topping: toppings)
        showOrderDetails(order)
        sendToServer(order)
        
        title = "Order done"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    }
    
    func showOrderDetails(_ order : Order) {
        orderLabel.text = order.name
        costLabel.text = "\(order.price)€"
    }
    
    func sendToServer(_ order : Order) {
        
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(order)
            // enviar data al server para su posterior procesado en la tienda
            
        }catch {
            print("error")
        }
    }
    
    @objc func done(){
        navigationController?.popToRootViewController(animated: true)
    }
}
