//
//  TestFooter.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

class TodayFooter: UICollectionReusableView {
    static var defaultHeight: CGFloat {
        Screen.height * 0.143
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
