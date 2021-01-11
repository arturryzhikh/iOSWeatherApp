//
//  ApiConnectable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 29.12.2020.
//

import Foundation


protocol ApiConnectable {
    
    
    var apiService: APIService! { get }
    
    var isFetching: Bool { get }
    
    
  

}
