//
//  UIColor+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIColor {
    class func weatherWhite() -> UIColor {
        return white.withAlphaComponent(0.85)
    }
    class func weatherTransparent() -> UIColor {
        return white.withAlphaComponent(0.5)
    }
    class func percentage() -> UIColor {
        return  #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    }
}
