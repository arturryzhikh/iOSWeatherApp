//
//  SectionViewModelProtocol.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 29.12.2020.
//

import Foundation



protocol SectionRepresentable {
    
    associatedtype HeaderViewModel: HeaderRepresentable
    associatedtype FooterViewModel: FooterRepresentable
    associatedtype Item = ItemReprasantable
    associatedtype Model = Decodable
    
    var headerViewModel: HeaderViewModel? { get }
    
    var footerViewModel: FooterViewModel? { get }
    
    var model: Model { get }
    
    var items : [Item]? { get }
    
    var numberOfItems: Int?  { get }
    
    init(with model: Model)
    
}

extension SectionRepresentable {
    var numberOfItems: Int? {
        return items?.count
    }
}
