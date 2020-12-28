//
//  CurrentWeatherCellViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 25.12.2020.
//


import Foundation

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
            return temp.stringTemperature
        }
        return "__"
    }
    var highLowTemp: String {
        
        if let highTemp = model.daily?.first?.temp?.max,
           let lowTemp = model.daily?.first?.temp?.min {
            return "H: \(highTemp.stringTemperature)   L: \(lowTemp.stringTemperature)"
        }
        return "__"
        
    }
    init(with model: WeatherResponse) {
        self.model = model
        
    }
   
}
