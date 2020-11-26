//
//  TestFooter.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

class TestFooter: UICollectionReusableView, SuplementaryView {
    static var kind: String {
        return UICollectionView.elementKindSectionFooter
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
