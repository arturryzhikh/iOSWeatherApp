//
//  WeatherLinkCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//
import UIKit

final class WeatherLinkCell: ClearCell, Customizable, Reusable {
    
     func reset() {
        
    }
    
    
    //MARK: Subviews
    private let linkLabel: UILabel = {
        let lbl = UILabel(transparentText: false, alignment: .center, font: .overView)
        lbl.numberOfLines = 3
        return lbl
    }()
    //MARK: Life cycle
    override func setup() {
        addSubviewForAutoLayout(linkLabel)
        setupConstraints()
        addSeparator(to: .top, aboveSubview: linkLabel)
        populateSubviews()
    }
    //MARK: Instance methods
    func setupConstraints() {
        NSLayoutConstraint.activate([
            linkLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            linkLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            linkLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
    func populateSubviews() {
        linkLabel.text = "Weather for Лазурная улица. Open in Maps"
    }
    
    
}
