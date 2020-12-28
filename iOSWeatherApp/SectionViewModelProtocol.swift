//
//  SectionViewModelProtocol.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 29.12.2020.
//

import Foundation



protocol SectionViewModelProtocol {
    
    associatedtype Item = ItemViewModelProtocol
    associatedtype Model = Decodable
    
    var header: Item? { get }
    
    var footer: Item? { get }
    
    var model: Model { get }
    
    var items : [Item]? { get }
    
    var numberOfItems: Int?  { get }
    
    init(with model: Model)
    
}

extension SectionViewModelProtocol {
    var numberOfItems: Int? {
        return items?.count
    }
}
