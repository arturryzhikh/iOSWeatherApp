//
//  WeatherLinkCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//
import UIKit

final class WeatherLinkCell: ClearCell {
    
    //MARK: Subviews
    private let linkLabel: UILabel = {
        let lbl = UILabel(transparentText: false, alignment: .center, font: .overView)
        lbl.numberOfLines = 3
        return lbl
    }()
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
