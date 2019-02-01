//
//  TableViewCell.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 28.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, Fillable {
    
    func fill(data: Int) {
        textLabel?.text = "\(data)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            accessoryType = .checkmark
        } else {
            accessoryType = .none
        }
    }
}
