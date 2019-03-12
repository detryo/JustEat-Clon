//
//  CupcakesTableViewController.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 6/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class CupcakesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cupcake Just Eat"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductsFactory.shared().cupcakes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cupcakeCell", for: indexPath)
        let cupake = ProductsFactory.shared().cupcakes[indexPath.row]
        
        cell.textLabel?.text = "\(cupake.name) - \(cupake.price)€"
        cell.detailTextLabel?.text = cupake.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let toppingsVC = storyboard?.instantiateViewController(withIdentifier: "ToppingsVC") as? ToppingsTableViewController else{
            fatalError("error")
        }
        
        toppingsVC.cupcake = ProductsFactory.shared().cupcakes[indexPath.row]
        navigationController?.pushViewController(toppingsVC, animated: true)
    }
}
