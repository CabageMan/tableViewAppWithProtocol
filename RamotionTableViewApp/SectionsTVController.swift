//
//  SectionsTVController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class SectionsTVController: UIViewController {
    
    let tableViewController = SectionalTableView<SectionalTVCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add data for table views
        tableViewController.items = [
            (name: "Section 1", cells: ["one", "two", "tree", "four", "five"]),
            (name: "Section 2", cells: ["eins", " zwei", " drei", "vier", "fünf"]),
            (name: "Section 3", cells: ["un", "deux", "trois", "quatre", "cinq"])
        ]
//        tableViewController.items = [
//            (name: "Section 1", cells: [1, 2, 3, 3, 4]),
//            (name: "Section 2", cells: [5, 6, 7, 8, 9]),
//            (name: "Section 3", cells: [10, 12, 14, 15])
//        ]
        
        // Create custom table view and add it to superview
        let tableView = tableViewController.customTableView
        self.view.addSubview(tableView)
        
        // Add constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
    }
}
