//
//  TableViewCell.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var rowLabel: UILabel!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            accessoryType = .checkmark
            //cell.checkLabel.text = "✔︎"
        } else {
            accessoryType = .none
            //cell.checkLabel.text = ""
        }
    }
}
