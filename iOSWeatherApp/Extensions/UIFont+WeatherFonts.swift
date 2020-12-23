//
//  UIFont+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIFont {
    class var locationLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.029).rounded(), weight: .regular)
    }
    class var regularTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.02).rounded(),weight: .regular)
    }
    class var HugeTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.08).rounded(),weight: .light)
    }
    class var day: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.022).rounded(),weight: .regular)
    }
    class var degree: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .regular)
    }
    class var percentage: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.015).rounded(),weight: .light)
    }
    class var weatherEmoji: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.04).rounded(),weight: .regular)
    }
    class var extendedInfoTitle: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.017).rounded(),weight: .regular)
    }
    class var extendedInfoValue: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.032).rounded(),weight: .regular)
    }
    
}
