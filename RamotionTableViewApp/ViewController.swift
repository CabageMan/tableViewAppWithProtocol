//
//  ViewController.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TableViewControllerDelegate {

    @IBOutlet weak var textButton: UIButton!
    
    // Implement changeButton method of TableViewControllerDelegate
    func changeButtonText(text: String?) {
        textButton.setTitle(text, for: .normal)
    }
    
    @IBAction func textButtonClick(_ sender: UIButton) {
        let nextViewControoler = TableViewController()
        nextViewControoler.delegate = self
        self.navigationController?.pushViewController(nextViewControoler, animated: true)
    }
}

