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
        UIFont.systemFont(ofSize: (Screen.height * 0.016).rounded(),weight: .regular)
    }
    class var HugeTemperature: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.08).rounded(),weight: .light)
    }
    class var degree: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .regular)
    }
    class var precipitaionProbability: UIFont {
        UIFont.systemFont(ofSize: (Screen.height * 0.11).rounded(),weight: .light)
    }
    
}
