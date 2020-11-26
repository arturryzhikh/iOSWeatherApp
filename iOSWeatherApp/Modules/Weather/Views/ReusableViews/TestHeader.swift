//
//  TestHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit
protocol SuplementaryView : class {
    static var kind: String { get  }
}
class TestHeader: UICollectionReusableView, SuplementaryView {
    static var kind: String {
       return  UICollectionView.elementKindSectionHeader
    }
    
        
    
    
        
}
