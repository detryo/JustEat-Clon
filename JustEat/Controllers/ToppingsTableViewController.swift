//
//  ToppingsTableViewController.swift
//  JustEat
//
//  Created by Cristian Sedano Arenas on 6/3/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class ToppingsTableViewController: UITableViewController {
    
    var cupcake : Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Implement Decorations"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Order", style: .plain, target: self, action: #selector(placeOrder))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    @objc func placeOrder(){
        
    }
}
