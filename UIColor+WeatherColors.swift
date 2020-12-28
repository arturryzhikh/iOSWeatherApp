//
//  UIColor+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIColor {
    class var weatherWhite: UIColor {
        return white.withAlphaComponent(1)
    }
    class var weatherTransparent: UIColor {
        return white.withAlphaComponent(0.65)
    }
    class var percentage: UIColor {
        return  #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    }
}
