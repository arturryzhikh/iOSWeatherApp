//
//  UILabel+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UILabel {
    
    convenience init(transparentText: Bool = false ,
                     alignment: NSTextAlignment = .center,
                     font: UIFont) {
        self.init()
        textColor = transparentText ? .weatherTransparent : .weatherWhite
        textAlignment = alignment
        numberOfLines = 1
        self.font = font
        
    }
}
