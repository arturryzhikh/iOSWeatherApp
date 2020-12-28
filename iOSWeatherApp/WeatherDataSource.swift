//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//


import Foundation

final class WeatherDataSource: NSObject , DataSourceProtocol, ApiConnectable {
    
    
    var sections: [Sections] = []
    
    var request: WeatherRequest?
    
    var apiService: APIService
    
    init(apiService: APIService = WeatherService.shared, request: WeatherRequest? = nil) {
        self.apiService = apiService
    }

    var numberOfSections: Int {
       4
    }
    func numberOfItemsIn(_ section: Int) -> Int {
       7
    }
    
}
    


