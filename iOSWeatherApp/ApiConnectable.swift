//
//  ApiConnectable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 29.12.2020.
//

import Foundation


protocol ApiConnectable {
    associatedtype Request: APIRequest
    
    var apiService: APIService { get }
    
    var request: Request? { get }
    
    init(apiService: APIService, request: Request?)

}
