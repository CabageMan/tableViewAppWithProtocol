//
//  SeveralTVsController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 30.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let age: Int
}

class SeveralTVsController: UIViewController {
    
    let firstTableViewController = CommonTableView<TableViewCell>()
    let secondTableViewController = CommonTableView<CustomTableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add data for table views
        let item = (name: "Alex", age: 14)
        firstTableViewController.items = [1,2,3,4]
        secondTableViewController.items = ["onion", "cabage", "potato", "cucumber", "pumpkin", "corn", "squash"]
        
        // Create custom table view and add it to superview
        let firstTableView = firstTableViewController.customTableView
        let secondTableView = secondTableViewController.customTableView
        self.view.addSubview(firstTableView)
        self.view.addSubview(secondTableView)
        
        // Add constraints
        firstTableView.translatesAutoresizingMaskIntoConstraints = false
        firstTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstTableView.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        firstTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        secondTableView.translatesAutoresizingMaskIntoConstraints = false
        secondTableView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        secondTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        secondTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        secondTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}
