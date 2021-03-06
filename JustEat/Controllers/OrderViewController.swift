//
//  OrderViewController.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 6/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Intents

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
        donate(order)
        
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

        }catch {
            print("error")
        }
    }
    
    func donate(_ order : Order) {
        
        let activity = NSUserActivity(activityType: "com.cristiansedano.JustEat.order")
        let orderName = order.name
        
        if order.cupcake.name.last == "a" {
            activity.title = "Pedir una \(orderName)"
        }else {
            activity.title = "Pedir un \(orderName)"
        }
        
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        
        let encoder = JSONEncoder()
        if let orderData = try? encoder.encode(order) {
            activity.userInfo = ["order" : orderData]
        }
        
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier(orderName)
        activity.suggestedInvocationPhrase = "I wont a dessert"
        self.userActivity = activity
    }
    
    @objc func done(){
        navigationController?.popToRootViewController(animated: true)
    }
}

