//
//  Double+StringTemperature.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

extension Double  {
    
    var stringTemperature: String {
       return String(format: "%.0f", self) + "°"
    }
}

