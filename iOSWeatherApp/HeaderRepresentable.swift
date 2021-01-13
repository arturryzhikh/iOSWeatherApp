//
//  HeaderRepresentable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 13.01.2021.
//

import Foundation

protocol HeaderRepresentable {
    
    associatedtype HeaderViewModel: ModelInstantiable
    
    var header: HeaderViewModel { get }
    
    var numberOfItems: Int { get }
    
    
   
}


