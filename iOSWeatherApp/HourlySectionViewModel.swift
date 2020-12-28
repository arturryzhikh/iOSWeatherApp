//
//  HourlyWeatherViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

struct HourlySectionViewModel: ItemViewModelProtocol {
    
    
    
    var items: [HourlyItemViewModel]  {
        var returnValue: [HourlyItemViewModel]
        guard let hourly = model.hourly else {
            return []
        }
        returnValue =  hourly.compactMap {
            HourlyItemViewModel(with: $0)
            
        }
        return returnValue
    }
    
    
    let model: WeatherResponse
    
    init(with model: WeatherResponse) {
        self.model = model
        
       
    }
    
    
}
