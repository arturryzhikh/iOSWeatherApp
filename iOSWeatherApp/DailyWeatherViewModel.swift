//
//  DailyWeatherViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

struct DailySectionViewModel: ItemReprasantable {
    
    var model: WeatherResponse
    
    var items: [DailyWeatherViewModel] {
        if let daily = model.daily {
            return daily.compactMap {
                DailyWeatherViewModel(with: $0)
            }
        }
        return []
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    init(with model: WeatherResponse) {
        self.model = model
    }
    
    
}


struct DailyWeatherViewModel: ItemReprasantable {
    
    var day: String {
        guard  let dt = model.dt else {
            return "--"
        }
        let date = Date(timeIntervalSince1970: Double(dt))
        return date.stringFromDate(dateFormat: "EEEE")
        
    }
    var temperatureHigh: String {
        guard let high = model.temp?.max else {
            return "__"
        }
        return high.stringTemperature
    }
    var temperatureLow: String {
        guard let low = model.temp?.min else {
            return "__"
        }
        return low.stringTemperature
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
        case .mist:
            return "🌫"
            
        }
    }
    var percentage: String {
        guard let prob = model.pop else {
            return "--"
        }
        let probability = Int(prob * 100)
        return String(probability) + "%"
    }

    let model: Daily
    
    init(with model: Daily) {
        self.model = model
    }
    
    
}
