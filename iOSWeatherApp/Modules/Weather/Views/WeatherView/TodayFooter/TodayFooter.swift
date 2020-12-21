//
//  TestFooter.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class TodayFooter: ClearTopBottomSeparatorCell {
    
    static var defaultHeight: CGFloat {
        Screen.height * 0.143
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //FIXME: move method to point when view model is available
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:Instance methods
   
    
    
}
