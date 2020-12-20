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
}
