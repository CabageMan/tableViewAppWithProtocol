//
//  TableViewController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit



class TableViewController<T: AllCasesProtocol & RawRepresentable>: UIViewController where T.RawValue == String {
    
    // MARK: Inits
    let tableViewController = TextFieldTableView<T>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create custom table view and add it to superview
        let tableView = tableViewController.textFieldTableView
        self.view.addSubview(tableView)
        
        // Add constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0).isActive = true
    }
}
