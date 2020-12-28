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
       8
            
        }
    }
    


