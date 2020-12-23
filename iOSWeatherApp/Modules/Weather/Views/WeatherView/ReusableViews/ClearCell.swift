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
        clipsToBounds = true
        backgroundColor = .clear
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///This is placeholder method to incapsulate initial setup of a view.
    ///This method calls during initialization within overriden init(frame: CGRect)
    ///Default implementation of this method does nothing
    ///Override this method to provide your initial setup for view and subviews
    func setup() {
        
    }
    
}

///enum that defines separator position in Clear Cell
enum SeparatorPosition {
    case top
    case bottom
}
extension ClearCell {
    func insertSeparator(position: SeparatorPosition, color: UIColor = .weatherWhite(), of height: CGFloat = 1 / Screen.scale, aboveSubview: UIView) {
        let separator = UIView()
        separator.backgroundColor = color
        addSubviewForAutoLayout(separator)
        if !self.subviews.contains(aboveSubview) {
            addSubviewForAutoLayout(aboveSubview)
        }
        insertSubview(separator, aboveSubview: aboveSubview)
        separator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        separator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: height).isActive = true
        if position == .top {
            separator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        } else if position == .bottom {
            separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
    }
}
