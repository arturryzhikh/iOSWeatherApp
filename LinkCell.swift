//
//  WeatherLinkCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//
import UIKit

final class LinkCell: ClearCell {
    
    //MARK: Subviews
    private let linkLabel: UILabel = {
        $0.numberOfLines = 3
        return $0
    }(UILabel(transparentText: false, alignment: .center, font: .overView))
    //MARK: Life cycle
    override func setup() {
        super.setup()
        addSubviewForAutoLayout(linkLabel)
        addSeparator(to: .top, aboveSubview: linkLabel)
        activateConstraints()
        
    }
    //MARK: Instance methods
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            linkLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            linkLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            linkLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
  
}
