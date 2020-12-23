//
//  UIFont+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit

extension UIFont {
    class var locationLabel: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.046).rounded(), weight: .light)
    }
    class var regularTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .light)
    }
    class var HugeTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.12).rounded(),weight: .light)
    }
   
    class var degree: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .light)
    }
    class var overView: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.02).rounded(),weight: .light)
    }
    class var percentage: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.015).rounded(),weight: .light)
    }
    class var weatherEmoji: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.04).rounded(),weight: .light)
    }
    class var extendedInfoTitle: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.017).rounded(),weight: .light)
    }
    class var extendedInfoValue: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.032).rounded(),weight: .light)
    }
    
}
