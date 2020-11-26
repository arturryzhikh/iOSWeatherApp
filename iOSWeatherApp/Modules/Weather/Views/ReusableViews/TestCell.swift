//
//  MyCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

class TestCell: UICollectionViewCell {
    override var frame: CGRect {
        willSet {
            printFunction(message: "\(newValue)")
        }
    }
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel()
        setSubviewForAutoLayout(label)
        label.centerInContainer(self)
        label.trailingTo(self)
        label.leadingTo(self)
        label.textColor = .black
        label.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
