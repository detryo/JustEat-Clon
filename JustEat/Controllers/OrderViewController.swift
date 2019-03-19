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

        let image = imageView.image
        imageView.image = nil
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
    }
}
