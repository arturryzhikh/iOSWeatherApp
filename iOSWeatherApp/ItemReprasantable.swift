//
//  ViewModelProtocol.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 27.12.2020.
//

import Foundation

protocol ItemReprasantable {
    
    associatedtype Model = Decodable
    
    var model: Model { get }
    
    init(model: Model)
    
}
