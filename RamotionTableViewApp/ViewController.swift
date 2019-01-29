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
        
        let nextViewControler = TableViewController<CustomEnum>()
        
        // Add closure as valueChanged property of table view controller 
        nextViewControler.valueChanged = { string in
            self.textButton.setTitle(string.rawValue, for: .normal)
        }
        self.navigationController?.pushViewController(nextViewControler, animated: true)
    }
}

