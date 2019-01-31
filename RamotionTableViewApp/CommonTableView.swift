//
//  CommonTableView.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 30.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

protocol CommonTableViewCell {
    associatedtype CellData
    func fill(data: CellData)
}

class CommonTableView<T: UITableViewCell & CommonTableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    var items = [T.CellData]()
    var customTableView: UITableView
    
    // MARK: Init
    override init() {
        customTableView = UITableView(frame: .zero)
        super.init()
        customTableView.register(T.self)
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: T = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.fill(data: items[indexPath.row])
        return cell
    }
}
