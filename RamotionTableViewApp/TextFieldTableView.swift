//
//  TextFieldTableView.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 29.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class TextFieldTableView: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var items = ["one", "two", "three"]
    var textFieldTableView: UITableView!
    var textChanged: ((String) -> ())?
    
    override init() {
        super.init()
        textFieldTableView = UITableView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: 300,
                                                       height: 200))
        textFieldTableView.register(TableViewCell.self, forCellReuseIdentifier: "textFieldCell")
        textFieldTableView.delegate = self
        textFieldTableView.dataSource = self
    }
    
    // MARK: table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCellIdentifier = "textFieldCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier,
                                                 for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textChanged?(items[indexPath.row])
    }
    
}
