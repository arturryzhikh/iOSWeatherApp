//
//  HTTPURLResponse.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//

import Foundation

extension HTTPURLResponse {
    
  var statusOK: Bool {
    return (200...299).contains(statusCode)
  }
    
}

