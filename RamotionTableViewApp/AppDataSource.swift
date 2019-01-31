//
//  AppDataSource.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 30.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import Foundation

// Define All Cases Protocol
protocol AllCasesProtocol {
    static var allCases: [Self] { get }
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
