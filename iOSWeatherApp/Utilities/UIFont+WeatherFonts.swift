//
//  UIFont+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIFont {
    class var locationLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.04), weight: .medium)

    }
    class var lightTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.028), weight: .light)
    }
    class var regularTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.028), weight: .regular)
    }
    class var hugeTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.08), weight: .regular)
     
    }
    class var degree: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.03),weight: .light)
    }
    class var overView: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.025), weight: .light)
    }
    class var weatherEmoji: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.04), weight: .light)
    }
    class var extendedInfoTitle: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.02), weight: .light)
        
    }
    class var extendedInfoValue: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.032), weight: .regular)
        
    }
    
}
