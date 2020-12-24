//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//


import Foundation

final class DataSource: NSObject  {
    
    //MARK: Properties
    private var service: APIService!
    
    private var model: WeatherResponse?
    
    
    //MARK: Life Cycle
    init(service: APIService = WeatherService.shared) {
        super.init()
        self.service = service
        getWeatherFor(latitude: 55.751244, longitude: 37.618423)
      
    }
   
    
    
}

//MARK: Networking
extension DataSource {
    
    private func getWeatherFor(latitude: Double, longitude: Double) {
        
        service.request(WeatherRequest(latitude: longitude, longitude: latitude)) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                self?.model = weather
            }
        }
    }
}

