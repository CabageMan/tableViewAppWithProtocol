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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a instance of CustomTextField
        let textFieldFrame = CGRect(x: textButton.frame.origin.x - 50,
                                    y: textButton.frame.origin.y + textButton.frame.size.height + 30,
                                    width: textButton.frame.size.width + 100,
                                    height: 30)
        
        let tableViewTextField = CustomTextField<AnotherTextFieldContent>(frame: textFieldFrame)
        self.view.addSubview(tableViewTextField)
    }
    
    // MARK: Actions
    
    @IBAction func textButtonClick(_ sender: UIButton) {
        let nextViewControler = TableViewController<TableViewContent>()
        // Add closure as valueChanged property of table view controller 
        nextViewControler.tableViewController.textChanged = { [weak self] string in
            self?.textButton.setTitle(string.rawValue, for: .normal)
        }
        self.navigationController?.pushViewController(nextViewControler, animated: true)
    }
    
    @IBAction func goToTVsButtonTap(_ sender: UIButton) {
        let nextViewController = SeveralTVsController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func goToSTVButtonTap(_ sender: UIButton) {
        let nextViewController = SectionsTVController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

