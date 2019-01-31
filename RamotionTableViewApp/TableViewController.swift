//
//  TableViewController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit



class TableViewController<T: AllCasesProtocol & RawRepresentable>: UIViewController where T.RawValue == String {
    
    // MARK: Inits
    let tableViewController = TextFieldTableView<T>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get display sizes
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Create custom table view and add it to superview
        tableViewController.textFieldTableView.frame = CGRect(
            x: 0, y: statusBarHeight, width: displayWidth, height: displayHeight - statusBarHeight
        )
        self.view.addSubview(tableViewController.textFieldTableView)
    }
}
