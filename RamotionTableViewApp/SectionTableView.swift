//
//  SectionTableView.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class SectionalTableView<T: UITableViewCell & CommonTableViewCell, H: UITableViewHeaderFooterView & CommonTableViewHeader>: NSObject, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    // MARK: Properties
    var items = [(H.HeaderData, [T.CellData])]()
    var customTableView = UITableView(frame: .zero)
    var openedSections = Set<Int>()
    
    // MARK: Init
    override init() {
        super.init()
        customTableView.registerCell(T.self)
        customTableView.registerHeader(H.self)
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openedSections.contains(section) ? items[section].1.count : 0
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: H = customTableView.dequeReusebleHeader()
        
        // Fill header data
        header.fillHeader(data: items[section].0, section: section)
        
        switch section {
            case 0:
                header.contentView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            case 1:
                header.contentView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            case 2:
                header.contentView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            default:
                header.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        // Add gesture recognizer
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(tableViewSectionTap(recognizer:)))
        recognizer.delegate = self
        header.addGestureRecognizer(recognizer)
    
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: T = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.fillCell(data: (items[indexPath.section].1[indexPath.row]))
        return cell
    }
    
    func createArrowLabel() -> UILabel {
        let arrowLabel = UILabel()
        
        return arrowLabel
    }
    
    @objc func tableViewSectionTap(recognizer: UIGestureRecognizer) {
        
        guard let header = recognizer.view as? H else { return }
        
        if !openedSections.insert(header.section).inserted {
            openedSections.remove(header.section)
        }
        
//        // Rotate image
//        openedSections.contains(section) ? header.arrowView.rotate(.pi/2, duration: 0.2) : header.arrowView.rotate(0.0, duration: 0.2)
        
        customTableView.reloadSections(IndexSet(header.section...header.section), with: .none)
    }
    
    
}
