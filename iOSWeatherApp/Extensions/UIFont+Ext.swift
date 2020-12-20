//
//  UIFont+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIFont {
    class var locationLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.04).rounded(), weight: .regular)
    }
    class var shortForcastLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .light)
    }
    class var temperatureLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.09).rounded(),weight: .light)
    }
    class var highLowLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.02).rounded(),weight: .light)
    }
}
