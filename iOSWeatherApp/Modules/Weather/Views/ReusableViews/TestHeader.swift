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
    var defaultSize: CGFloat {
        return 300
    }
    var minimumSize: CGFloat {
        return defaultSize / 2
    }
    var maximumSize: CGFloat {
        return 500
    }
        
    
    
        
}
