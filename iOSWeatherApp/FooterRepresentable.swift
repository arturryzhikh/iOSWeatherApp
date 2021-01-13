//
//  FooterRepresentable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 13.01.2021.
//

import Foundation


protocol FooterRepresentable {
    
    associatedtype FooterViewModel: ModelInstantiable
    
    var footer: FooterViewModel { get }
    
    var numberOfItems: Int { get }
}
