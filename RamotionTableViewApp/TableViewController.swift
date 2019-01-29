//
//  TableViewController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

enum TableViewContent: String, AllCasesProtocol {
    static var allCases: [TableViewContent] {
        return [.firstRow, .secondRow, .thirdRow, .fourthRow, .fifthRow, .sixthRow, .seventhRow, .eightsRow, .ninthRow, .tenthRow, .row11, .row12, .row13, .row14, .row15, .row16, .row17, .row18, .row19]
    }
    
    case firstRow
    case secondRow
    case thirdRow
    case fourthRow
    case fifthRow
    case sixthRow
    case seventhRow
    case eightsRow
    case ninthRow
    case tenthRow
    case row11
    case row12
    case row13
    case row14
    case row15
    case row16
    case row17
    case row18
    case row19
}

enum CustomEnum: String, AllCasesProtocol {
    static var allCases: [CustomEnum] = [.one, .two, .three]
    
    case one, two, three
}

// Define All Cases Protocol
protocol AllCasesProtocol {
    static var allCases: [Self] { get }
}

class TableViewController<T: AllCasesProtocol & RawRepresentable>: UIViewController, UITableViewDelegate, UITableViewDataSource where T.RawValue == String {
    
    // Create instance of UitableView
    private var customTableView: UITableView!
    
    // Create table view data source
    private var allRows = T.allCases
    
    // Create variable with function type
    var valueChanged: ((T) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get display sizes
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Create custom table vuew and add it to superview
        customTableView = UITableView(frame: CGRect(x: 0,
                                                    y: statusBarHeight,
                                                    width: displayWidth,
                                                    height: displayHeight - statusBarHeight))
        customTableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        customTableView.delegate = self
        customTableView.dataSource = self
        self.view.addSubview(customTableView)
    }
    
    // MARK: table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCellIdentifier = "tableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? TableViewCell else {
            fatalError("Dequeued cell is not a instance of TableViewCell")
        }
        
        cell.textLabel?.text = allRows[indexPath.row].rawValue
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        valueChanged?(allRows[indexPath.row])
    }
 
}
