//
//  ItemRepresentable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 13.01.2021.
//

import Foundation

protocol ItemRepresentable {
    
    associatedtype ItemViewModel: ModelInstantiable
    
    var items: [ItemViewModel] { get }
    
    var numberOfItems: Int { get }
    
}
