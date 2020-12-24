//
//  UIColor+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIColor {
    class var weatherWhite: UIColor {
        return white.withAlphaComponent(0.85)
    }
    class var weatherTransparent: UIColor {
        return white.withAlphaComponent(0.5)
    }
    class var percentage: UIColor {
        return  #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }
}
