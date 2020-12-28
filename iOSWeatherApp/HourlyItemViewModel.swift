//
//  HourlyWeatherViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

struct HourlyItemViewModel: ItemViewModelProtocol {
   
    let model: Current
    
    var hour: String  {
        guard let dt = model.dt else {
            return "--"
        }
        let hourlyDate = Date(timeIntervalSince1970: Double(dt))
        if Calendar.current.isDate(hourlyDate, equalTo: Date(), toGranularity: .day) &&
            Calendar.current.isDate(hourlyDate, equalTo: Date(), toGranularity: .hour) {
            return "Now"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: hourlyDate)
    }

    var weatherEmoji: String {
        
        guard let description = model.weather?.first?.main else {
            return "..."
        }
        switch description {
        
        case .clear:
            return "☀️"
        case .clouds:
            return "☁️"
        case .rain:
            return "🌧"
        case .snow:
            return "❄️"
            
        }
        
    }
    var temperature: String {
        if let temp = model.temp {
            return temp.stringTemperature
        }
        return "__"
    }
    
    init(with model: Current) {
        self.model = model
        
    }
    
}
