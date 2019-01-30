//
//  CustomTextField.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 29.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class CustomTextField<T: AllCasesProtocol & RawRepresentable>: UITextField, UITextFieldDelegate where T.RawValue == String {
    
    // MARK: Inits
    let tableViewController = TextFieldTableView<T>()
    let tableViewToolBar = UIToolbar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        textfieldSetUp()
    }
     // Required init must be here. Make it minimal
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    // MARK: Helpers
    private func textfieldSetUp() {
        // Set textfield view
        let textfield = self
        textfield.placeholder = "Tap to fill"
        textfield.font = .systemFont(ofSize: 17)
        textfield.returnKeyType = .done
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        
        // Set tableView toolbar
        tableViewToolBar.barStyle = .default
        tableViewToolBar.isTranslucent = true
        tableViewToolBar.barTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        tableViewToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title: "Done", style: .done, target: self, action: #selector(doneButtonPressed)
        )
        tableViewToolBar.setItems([doneButton], animated: false)
        tableViewToolBar.isUserInteractionEnabled = true
        
        // Implementation of "textChanged" propetty"of TextFieldTableView
        // It must be weak or unnowed
        tableViewController.textChanged = { [weak self] in self?.text = $0.rawValue }
        
        // Add table view and tab bar as input and accessory views of text field
        tableViewController.textFieldTableView.frame.size = CGSize(
            width: UIScreen.main.bounds.size.width, height: 200
        )
        textfield.inputView = tableViewController.textFieldTableView
        textfield.inputAccessoryView = tableViewToolBar
    }
    
    // MARK: Actions
    @objc func doneButtonPressed() {
        self.resignFirstResponder()
    }
    
}
