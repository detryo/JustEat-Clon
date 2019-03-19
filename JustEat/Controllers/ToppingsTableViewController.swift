//
//  ToppingsTableViewController.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 6/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class ToppingsTableViewController: UITableViewController {
    
    var cupcake : Product!
    var selectedTopping = Set<Product>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Implement Decorations"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Order", style: .plain, target: self, action: #selector(placeOrder))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductsFactory.shared().topping.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toppingsCell", for: indexPath)
        let topping = ProductsFactory.shared().topping[indexPath.row]
        
        cell.textLabel?.text = "\(topping.name) - \(topping.price)€"
        cell.detailTextLabel?.text = topping.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            fatalError("error")
        }
        let topping = ProductsFactory.shared().topping[indexPath.row]
        
        if selectedTopping.contains(topping) {
            cell.accessoryType = .none
            selectedTopping.insert(topping)
        } else {
            cell.accessoryType = .checkmark
            selectedTopping.insert(topping)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
 

    @objc func placeOrder(){
        guard let orderViewController = storyboard?.instantiateViewController(withIdentifier: "OrderVC") as? OrderViewController else {
            fatalError("error")
        }
        
        orderViewController.cupcake = cupcake
        orderViewController.toppings = selectedTopping
        
        navigationController?.pushViewController(orderViewController, animated: true)
    }
}
