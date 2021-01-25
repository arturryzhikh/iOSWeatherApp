//
//  Double+StringTemperature.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

extension Double  {
    
    var stringTemperature: String {
        
        if self > -1 && self < 0  {
            return "0°"
        } else {
            return String(format: "%.0f", self) + "°"
        }
        
    }
}

