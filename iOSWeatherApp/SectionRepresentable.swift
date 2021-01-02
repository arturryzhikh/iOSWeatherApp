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
    associatedtype ItemViewModel = ItemReprasantable
    associatedtype Model = Decodable
    
    var headerViewModel: HeaderViewModel? { get }
    
    var footerViewModel: FooterViewModel? { get }
    
    var model: Model { get }
    
    var items : [ItemViewModel]? { get }
    
    var numberOfItems: Int?  { get }
    
    init(model: Model)
    
}
