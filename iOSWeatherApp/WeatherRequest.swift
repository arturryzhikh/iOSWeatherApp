//
//  OnecallRequest.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//

import Foundation


struct WeatherRequest: APIRequest {
    
    typealias Response = WeatherResponse
    
    var endPoint: String {
        return API.oneCallendpoint
    }
//    String(Locale.current.languageCode ?? "en") //current language code
    var queries: [String : String ] = [
        "lang" : "ru" ,
        "exclude" :  "minutely,alerts",
        "units": "metric",
    ]
    
    init(latitude: Double, longitude: Double) {
        queries.updateValue(String(latitude), forKey: "lat")
        queries.updateValue(String(longitude), forKey: "lon")
        
    }
}
