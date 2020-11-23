//
//  Cell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

class Header: UICollectionReusableView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
