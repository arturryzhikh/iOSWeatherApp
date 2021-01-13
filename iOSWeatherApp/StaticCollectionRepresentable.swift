//
//  CollectionRepresentable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 13.01.2021.
//

import Foundation


protocol StaticCollectionRepresentable: NSObject {
    
    associatedtype Model: Codable
    
    var sections: [Int] { get }
    
    var model: Model? { get }
    
    var numberOfSections: Int { get }
    
    func numberOfItemsIn(_ section: Int) -> Int
    
    func generateSectionViewModels(model: Model)
    
}
