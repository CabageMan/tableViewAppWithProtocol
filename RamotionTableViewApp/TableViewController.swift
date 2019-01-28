//
//  TableViewController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit
import Foundation

// Define the TableViewControllerDelegate
protocol TableViewControllerDelegate: class {
    func changeButtonText(text: String?)
}

class TableViewController: UITableViewController {
    
    weak var delegate: TableViewControllerDelegate?
    
    enum TableViewContent: String {
        case firstRow
        case secondRow
        case thirdRow
        case fourthRow
        case fifthRow
        
        static var allRows: [TableViewContent] {
            return [.firstRow, .secondRow, .thirdRow, .fourthRow, .fifthRow]
        }
    }
    
    // MARK: table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewContent.allRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCellIdentifier = "tableViewCell"
        
        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? TableViewCell else {
            fatalError("Dequeued cell is not a instance of TableViewCell")
        }
        
        cell.rowLabel.text = TableViewContent.allRows[indexPath.row].rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for cell in tableView.visibleCells as! [TableViewCell] {
            if tableView.visibleCells.index(of: cell) == indexPath.row {
                cell.checkLabel.text = "✔︎"
                delegate?.changeButtonText(text: cell.rowLabel.text)
            } else {
                cell.checkLabel.text = ""
            }
        }
    }
    
}
