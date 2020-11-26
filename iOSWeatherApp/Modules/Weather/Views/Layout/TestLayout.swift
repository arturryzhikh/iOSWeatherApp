//
//  TestLayout.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class TestLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        printFunction(message: "Super class \(superclass)")
      
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        printFunction(message: "New bounds: \(newBounds)")
        return false
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        printFunction(message: "rect: \(rect) attributes : \(attributes)" )
        
        return attributes
        
    }
}
