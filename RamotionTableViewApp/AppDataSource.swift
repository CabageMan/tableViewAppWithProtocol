//
//  AppDataSource.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 30.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

// MARK: Protocol and extension definition

protocol AllCasesProtocol {
    static var allCases: [Self] { get }
}

protocol Fillable {
    associatedtype CellData
    func fill(data: CellData)
}

extension UITableView {
    // Table view header
    func registerHeader(_ headerClass: AnyClass) {
        register(headerClass, forHeaderFooterViewReuseIdentifier: "\(headerClass)")
    }
    
    func dequeReusebleHeader<H: UITableViewHeaderFooterView>() -> H {
        return dequeueReusableHeaderFooterView(withIdentifier: "\(H.self)") as! H
    }
    
    // Table view cells
    func registerCell(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: "\(cellClass)")
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
    }
}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
}

// MARK: Data source definition

enum SectionalTVDataModel {
    static let data1 = [
        (name: "Section 1", cells: ["one", "two", "tree", "four", "five"]),
        (name: "Section 2", cells: ["eins", " zwei", " drei", "vier", "fünf"]),
        (name: "Section 3", cells: ["eins", " zwei", " drei", "vier", "fünf"]),
        (name: "Section 4", cells: ["un", "deux", "trois", "quatre", "cinq"])
    ]
    static let data2 = [
        (name: 1, cells: [1, 2, 3, 3, 4]),
        (name: 2, cells: [5, 6, 7, 8, 9]),
        (name: 3, cells: [10, 12, 14, 15])
    ]
    
}

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

enum TextFieldContent: String, AllCasesProtocol {
    static var allCases: [TextFieldContent] {
        return [.one, .two, .three, .four, .five]
    }
    
    case one
    case two
    case three
    case four
    case five
}

enum AnotherTextFieldContent: String, AllCasesProtocol {
    static var allCases: [AnotherTextFieldContent] = [.cabage, . potato, .onion, . cucumber, .pumpkin]
    case cabage, potato, onion, cucumber, pumpkin
}
