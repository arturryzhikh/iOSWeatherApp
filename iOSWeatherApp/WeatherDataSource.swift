//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//


import Foundation


final class WeatherDataSource: NSObject , DataSource {
    
    
    
    var apiService: APIService?
    
    init(apiService: APIService? = WeatherService.shared) {
        self.apiService = apiService
    }

    var numberOfSections: Int {
       return 5
    }
    
    
    func numberOfItemsIn(_ section: Int) -> Int {
        
        switch section {
        
        case 0:
            return 0
        case 1:
            return 9
        case 2:
            return 1
        case 3:
            return 10
        case 4:
            return 1
        default:
            assert(false)
            
        }
    }
    
}
