//
//  DataCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 20.12.2020.
//

import UIKit
///Base class for all Custom UI Collection View Cells
public class ClearCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        initialSetup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///This is placeholder method to incapsulate initial setup of a view.
    ///This method calls during initialization within overriden init(frame: CGRect) method of a UICollectionView superclass.
    ///Override this method to provide your initial setup for view and subviews
    func initialSetup() {
        clipsToBounds = true
        backgroundColor = .clear
    }
   
    
    
}
