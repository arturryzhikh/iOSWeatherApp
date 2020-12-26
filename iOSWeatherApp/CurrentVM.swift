//
//  CurrentWeatherCellViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 25.12.2020.
//


import Foundation



protocol ViewModel {
    
    associatedtype Model = Decodable
    
    init(from model: Model )
    
}


struct CurrentVM: ViewModel {
    
    let location: String
    
    let description: String
    
    let temperature: String
    
    let highTemp: String
    
    let lowTemp: String
    
    
    init(from model: Current) {
        
    }
    
    
}
