//
//  ViewModelProtocol.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 27.12.2020.
//

import Foundation

protocol ItemViewModelProtocol {
    
    associatedtype Model = Decodable
    
    var model: Model { get }
    
    init(with model: Model)
    
}
