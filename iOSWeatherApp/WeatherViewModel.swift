//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//


import Foundation

final class WeatherViewModel: NSObject  {
    
    //MARK: Properties
    private var service: APIService!
    
    private var model: WeatherResponse?
    
    
    //MARK: Life Cycle
    init(service: APIService = WeatherService.shared) {
        super.init()
        self.service = service
        getWeatherFor(latitude: 55.751244, longitude: 37.618423)
        
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

//MARK: Networking

extension WeatherViewModel {
    
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

