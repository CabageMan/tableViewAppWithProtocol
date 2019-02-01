//
//  SectionTableView.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class SectionalTableView<T: UITableViewCell & Fillable, H: UITableViewHeaderFooterView & Fillable>: NSObject, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    // MARK: Properties
    var items: [(H.CellData, [T.CellData])] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let tableView = UITableView()
    private var openedSections = Set<Int>()
    
    // MARK: Init
    override init() {
        super.init()
        tableView.registerCell(T.self)
        tableView.registerHeader(H.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openedSections.contains(section) ? items[section].1.count : 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: H = tableView.dequeReusebleHeader()
        
        // Fill header data
        header.fill(data: items[section].0)
        header.tag = section
        
        // Add gesture recognizer
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(tableViewSectionTap(recognizer:)))
        recognizer.delegate = self
        header.addGestureRecognizer(recognizer)
    
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: T = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.fill(data: (items[indexPath.section].1[indexPath.row]))
        return cell
    }
    
    @objc func tableViewSectionTap(recognizer: UIGestureRecognizer) {
        
        guard let header = recognizer.view as? H else { return }
        
        if !openedSections.insert(header.tag).inserted {
            openedSections.remove(header.tag)
        }
        tableView.reloadSections(IndexSet(integer: header.tag), with: .none)
    }
}
