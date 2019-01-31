//
//  SectionaTVHeader.swift
//  RamotionTableViewApp
//
//  Created by ViktorsMacbook on 31.01.19.
//  Copyright © 2019 Viktor Bednyi Inc. All rights reserved.
//

import UIKit

class SectionalTVHeader: UITableViewHeaderFooterView {
    
    let titleLabel = UILabel()
    let arrowView = UIImageView(image: UIImage(named: "downArrow.png"))
    
    override convenience init(reuseIdentifier: String?) {
        self.init(reuseIdentifier: reuseIdentifier)
        
        // Title label
        let marginGuide = contentView.layoutMarginsGuide
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        // Add arrow view and it's constraints
        contentView.addSubview(arrowView)
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        arrowView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        arrowView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        arrowView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        // Add gesture recognizer
//        let recognizer = UITapGestureRecognizer(target: self, action:#selector(tableViewSectionTap(recpgnizer:)))
//        recognizer.delegate = self
//        header.addGestureRecognizer(recognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
}
