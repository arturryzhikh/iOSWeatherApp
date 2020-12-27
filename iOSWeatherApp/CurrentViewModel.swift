//
//  CurrentWeatherCellViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 25.12.2020.
//


import Foundation

struct HourlyViewModel: ItemViewModelProtocol {
    
    var model: Current
    
 
    
    init(with model: Current) {
        self.model = model
        
    }
    
   
}


struct CurrentViewModel: ItemViewModelProtocol {
    
    let model: WeatherResponse
    
    var location: String {
        return model.timezone ?? "__"
    }
    
    var description: String {
        return model.current?.weather?.first?.main?.rawValue ?? "__"
    }
    
    var temperature: String {
        if let temp = model.current?.temp {
            return String(format: "%.0f", temp) + "°"
        } else {
            return "__"
        }
        
    }
    
    var highLowTemp: String {
        if let highTemp = model.daily?.first?.temp?.max,
           let lowTemp = model.daily?.first?.temp?.min {
            return "H: \(String(format: "%.0f", highTemp))°" + "  " + "L: \(String(format: "%.0f", lowTemp))°"
        } else {
            return "__"
        }
    }
    
    init(with model: WeatherResponse)  {
        self.model = model
        
    }
}
