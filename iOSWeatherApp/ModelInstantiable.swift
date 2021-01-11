//
//  ItemViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 04.01.2021.
//

import Foundation

protocol ModelInstantiable {
    
    associatedtype Model: Codable
    
    var model: Model { get }
    
    init(model: Model)
    
}


