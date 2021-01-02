//
//  HourlyWeatherViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

struct CurrentHourlyFooterVM: FooterRepresentable {
    
    
    
    var items: [HourlyItemViewModel]  {
        var returnValue: [HourlyItemViewModel]
        guard let hourly = model.hourly else {
            return []
        }
        returnValue =  hourly.compactMap {
            HourlyItemViewModel(model: $0)
            
        }
        return returnValue
    }
    
    
    let model: WeatherResponse
    
    init(model: WeatherResponse) {
        self.model = model
        
       
    }
    
    
}
