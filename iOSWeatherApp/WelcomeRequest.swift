//
//  OnecallRequest.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//

import Foundation


struct WelcomeRequest: APIRequest {
    
    typealias Response = Welcome
    
    var endPoint: String {
        return API.oneCallendpoint
    }
    
    var queries: [String : String] = [:]
    
    init(latitude: Double, longitude: Double) {
        queries.updateValue(String(latitude), forKey: "lat")
        queries.updateValue(String(longitude), forKey: "lon")
        
     
       
    }
    
    
}

