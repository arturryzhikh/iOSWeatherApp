//
//  DataSource.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 27.12.2020.
//

import Foundation

protocol DataSourceProtocol {
    
    associatedtype Sections = SectionViewModelProtocol
        
    var sections: [Sections] { get }
    
    var numberOfSections: Int? { get }
    
    func numberOfItemsIn(_ section: Int) -> Int
    
}

extension DataSourceProtocol {
    var numberOfSections: Int? {
        return sections.count
    }
}
