//
//  CurrentWeatherCellViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 25.12.2020.
//


import Foundation



protocol ViewModel {
    
    associatedtype Model = Decodable
    
    init?(from model: Model )
    
}


struct CurrentVM: ViewModel {
    
    let location: String
    
    let description: String
    
    let temperature: String
    
    let highLowTemp: String
    
   
    
    
    init?(from model: WeatherResponse) {
        guard let location = model.timezone,
              let description  = model.current?.weather?.first?.main?.rawValue,
              let temperature = model.current?.temp,
              let highTemp = model.daily?.first?.temp?.max,
              let lowTemp = model.daily?.first?.temp?.min else {
            return nil
        }
        self.location = location
        self.description = String(description)
        self.temperature = String(format: "%.0f", temperature) + "°"
        self.highLowTemp = "H: \(String(format: "%.0f", highTemp))°" + "  " + "L: \(String(format: "%.0f", lowTemp))°"
        
        
    }
    
    
}
