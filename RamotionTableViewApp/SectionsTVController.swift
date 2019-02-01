//
//  SectionsTVController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class SectionsTVController: UIViewController {
    
    let tableViewController = SectionalTableView<SectionalTVCell, SectionalTVHeader>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add data for table views
        tableViewController.items = SectionalTVDataModel().data1
        
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
