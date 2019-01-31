//
//  CustomTableViewCell.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.tintColor = UIColor.red
            self.contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            accessoryType = .checkmark
        } else {
            self.contentView.backgroundColor = nil
            accessoryType = .none
        }
    }
    
}
