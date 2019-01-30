//
//  ViewController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    
    @IBAction func textButtonClick(_ sender: UIButton) {
        let nextViewControler = TableViewController<TableViewContent>()
        // Add closure as valueChanged property of table view controller 
        nextViewControler.valueChanged = { string in
            self.textButton.setTitle(string.rawValue, for: .normal)
        }
        self.navigationController?.pushViewController(nextViewControler, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a instance of CustomTextField
        let textFieldFrame = CGRect(x: textButton.frame.origin.x - 50,
                                    y: textButton.frame.origin.y + textButton.frame.size.height + 30,
                                    width: textButton.frame.size.width + 100,
                                    height: 30)
        
        let tableViewTextField = CustomTextField(frame: textFieldFrame)
        self.view.addSubview(tableViewTextField)
    }
}

