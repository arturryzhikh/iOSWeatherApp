//
//  CurrentHourlySectionViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 02.01.2021.
//

import Foundation

struct CurrentHourlySectionViewModel: SectionRepresentable {
    
    var headerViewModel: CurrentHourlyHeaderVM? {
        return CurrentHourlyHeaderVM(model: model)
    }
    
    var footerViewModel: CurrentHourlyFooterVM? {
        return CurrentHourlyFooterVM(model: model)
    }
    
    var model: WeatherResponse
    
    var items: [CurrentHourlyHeaderVM]? = nil
    
    var numberOfItems: Int?
    
    init(model: WeatherResponse) {
        self.model = model
        
    }
    
}
