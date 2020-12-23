//
//  MyCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

final class TestCell: ClearCell {
    var label: UILabel!
    override func setup() {
        super.setup()
        
        label = UILabel()
        addSubviewForAutoLayout(label)
        //constraint label
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
        ])
        label.textColor = .weatherWhite()
        label.textAlignment = .center
    }
    
   
}
