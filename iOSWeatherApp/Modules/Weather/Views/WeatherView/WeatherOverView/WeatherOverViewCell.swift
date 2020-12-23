//
//  WeatherOverViewCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

final class WeatherOverViewCell: ClearCell, Customizable, DataDriven {
    //MARK: Subviews
    private let overViewTextView: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .left
        tv.font = .regularTemperature
        tv.textColor = .weatherWhite
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = false
        tv.textContainerInset = .zero
        tv.textContainer.maximumNumberOfLines = 4
        tv.textContainer.lineFragmentPadding = 0
        return tv
    }()
    //MARK: Life cycle
    override func setup() {
        addSubviewForAutoLayout(overViewTextView)
        addSeparator(to: .top, aboveSubview: overViewTextView)
        addSeparator(to: .bottom, aboveSubview: overViewTextView)
        setupConstraints()
        populateSubviews()
    }
    //MARK: Instance methods
    func setupConstraints() {
        NSLayoutConstraint.activate([
            overViewTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overViewTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overViewTextView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
    func populateSubviews() {
        overViewTextView.text = "Today: Mostly cloudy congitions with 7m/s winds from south/ The high will be 27.pPartly cloudy tonight with a low of 16"
    }
    
    
}
