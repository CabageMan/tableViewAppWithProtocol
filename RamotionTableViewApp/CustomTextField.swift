//
//  CustomTextField.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 29.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    
    let tableViewController = TextFieldTableView()
    let tableViewToolBar = UIToolbar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        textfieldSetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        textfieldSetUp()
    }
    
    private func textfieldSetUp() {
        // Set textfield view
        let textfield = self
        textfield.placeholder = "Tap to fill"
        textfield.font = UIFont.systemFont(ofSize: 17)
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        
        // Set tableView toolbar
        tableViewToolBar.barStyle = UIBarStyle.default
        tableViewToolBar.isTranslucent = true
        tableViewToolBar.barTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        tableViewToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(self.doneButtonPressed))
        tableViewToolBar.setItems([doneButton], animated: false)
        tableViewToolBar.isUserInteractionEnabled = true
        
        
        // Create instance of TextFieldTableView
        let tableView: UITableView = tableViewController.textFieldTableView
        
        tableViewController.textChanged = { string in
            self.text = string
        }
        // Add table view and tab bar as input and accessory views of text field
        textfield.inputView = tableView
        textfield.inputAccessoryView = tableViewToolBar
    }
    
    @objc func doneButtonPressed() {
        self.resignFirstResponder()
    }
    
}
