//
//  CustomTVHeader.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 01.02.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class CustomTVHeader: UITableViewHeaderFooterView, Fillable {
    
    let titleLabel = UILabel()
    let arrowView = UIImageView(image: UIImage(named: "downArrow.png"))
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Title label
        titleLabel.textColor = UIColor.white
        contentView.addSubview(titleLabel)
        
        // Add arrow
        contentView.addSubview(arrowView)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // Title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        // Arrow label
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        arrowView.rightAnchor.constraint(equalTo: marginGuide.rightAnchor).isActive = true
        arrowView.widthAnchor.constraint(equalTo: marginGuide.heightAnchor, multiplier: 0.8).isActive = true
        arrowView.heightAnchor.constraint(equalTo: arrowView.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    func fill(data: Int) {
        titleLabel.text = "\(data)"
    }
}
