//
//  CurrentHourlySectionVM.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 04.01.2021.
//

import Foundation


struct CurrentHourlySectionVM: ModelInstantiable, HeaderRepresentable, FooterRepresentable {
    
   
    
    var numberOfItems: Int {
        return 0
    }
    
    var header: CurrentHeaderVM {
        
        return CurrentHeaderVM(model: model)
    }
    
    var footer: HourlyFooterVM {
        
        return FooterViewModel(model: model)
    }
    
    var model: WeatherResponse
    
    init(model: WeatherResponse) {
        self.model = model
        
    }
    
 
}

struct CurrentHeaderVM: ModelInstantiable {
    
    let model: WeatherResponse
    
    var location: String {
        return model.timezone?.components(separatedBy: "/")[1].replacingOccurrences(of: "_", with: " ") ?? "__"
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
    init(model: WeatherResponse) {
        self.model = model
        
    }
   
}


struct HourlyFooterVM: ModelInstantiable {
    
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

struct HourlyItemViewModel: ModelInstantiable {
   
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
        case .mist:
            return "🌫"
            
        }
        
    }
    var temperature: String {
        if let temp = model.temp {
            return temp.stringTemperature
        }
        return "__"
    }
    
    init(model: Current) {
        self.model = model
        
    }
    
}
