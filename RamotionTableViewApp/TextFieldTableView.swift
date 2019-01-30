//
//  TextFieldTableView.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 29.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

extension UITableView {
    func register(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: "\(cellClass)")
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
    }
}

class TextFieldTableView<T: AllCasesProtocol & RawRepresentable>: NSObject, UITableViewDataSource, UITableViewDelegate where T.RawValue == String {
    
    
    // MARK: Init
    // It's important that generic type T is used
    private var items = T.allCases
    var textChanged: ((T) -> ())?
    
    var textFieldTableView: UITableView
    
    override init() {
        // If textFieldTableView will init before super init it will be initialized at super.init call
        textFieldTableView = UITableView(frame: .zero)
        super.init()
        textFieldTableView.register(TableViewCell.self)
        textFieldTableView.delegate = self
        textFieldTableView.dataSource = self
    }
    
    // MARK: table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].rawValue
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textChanged?(items[indexPath.row])
    }
    
}
