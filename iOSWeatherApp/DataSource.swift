//
//  DataSource.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 27.12.2020.
//

import Foundation



protocol DataSource {
    
   var apiService: APIService? { get }
    
    var numberOfSections: Int { get }
    
    func numberOfItemsIn(_ section: Int) -> Int
    
    init(apiService: APIService?)
    
}
