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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get instance of next view controller
        if let nextViewController = segue.destination as? TableViewController {
            nextViewController.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

