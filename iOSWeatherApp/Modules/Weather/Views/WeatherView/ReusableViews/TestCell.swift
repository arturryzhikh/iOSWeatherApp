//
//  MyCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

final class TestCell: ClearCell {

    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func initialSetup() {
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
