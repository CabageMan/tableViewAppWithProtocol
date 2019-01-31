//
//  SectionTableView.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class SectionalTableView<T: UITableViewCell & CommonTableViewCell>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    var items = [(String, [T.CellData])]()
    var customTableView = UITableView(frame: .zero)
    
    // MARK: Init
    override init() {
        super.init()
        customTableView.register(T.self)
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].1.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let defaultSectionHeight: CGFloat = 50.0
        switch section {
            case 0:
                return defaultSectionHeight + 15.0
            case 1:
                return defaultSectionHeight + 30.0
            case 2:
                return defaultSectionHeight + 8.0
            default:
                return defaultSectionHeight
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.white
        }
        
        switch section {
            case 0:
                view.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            case 1:
                view.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            case 2:
                view.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            default:
                view.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: T = tableView.dequeueReusableCell(indexPath: indexPath)
//        cell.textLabel?.text = "\(items[indexPath.section].1[indexPath.row])"
        cell.fill(data: (items[indexPath.section].1[indexPath.row]))
        return cell
    }
    
    
}
