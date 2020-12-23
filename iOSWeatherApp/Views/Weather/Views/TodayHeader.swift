//
//  TestHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class TodayHeader: ClearCell, Customizable, DataDriven {
    //MARK: Static  Properties
    static var defaultHeight: CGFloat {
        Screen.height * 0.453
    }
    static var minimumHeight: CGFloat {
        Screen.height * 0.143
    }
    //MARK: Other Properties
    private var computedAlpha: CGFloat { //calculate alpha of temperature and high low labels depending on view height
        let transparentY = temperatureLabel.frame.height + temperatureLabel.frame.origin.y
        return max((frame.height - transparentY) / (TodayHeader.defaultHeight - transparentY), 0)
    }
    private var topConstraint: NSLayoutConstraint?
    private var topPadding: CGFloat {
        return frame.height * 0.3
    }
    //MARK: Life cycle
    override func setup() {
        super.setup()
        addSubviewsForAutoLayout([locationLabel,shortForcastLabel,temperatureLabel,highLowLabel,degreeLabel])
        setupConstraints()
        populateSubviews()
    }
    override func layoutSubviews() {
        //update top constraint because origin of view changes during scrolling
        topConstraint?.constant = topPadding
        highLowLabel.alpha = computedAlpha
        temperatureLabel.alpha = computedAlpha
        degreeLabel.alpha =  computedAlpha
    }
    //MARK: Subviews
    private let locationLabel: UILabel = {
        let lbl = UILabel(transparentText: false,font: .locationLabel)
        return lbl
    }()
    private let shortForcastLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel(font: .HugeTemperature)
        return lbl
    }()
    private let highLowLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let degreeLabel: UILabel = {
        let lbl = UILabel(font: .degree)
        lbl.text = "o"
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return lbl
    }()
    
    func setupConstraints() {
        topConstraint = locationLabel.topAnchor.constraint(equalTo: topAnchor,constant: topPadding)
        topConstraint?.isActive = true
        let constraints = [
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shortForcastLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            shortForcastLabel.centerXAnchor.constraint(equalTo: locationLabel.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: shortForcastLabel.bottomAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: shortForcastLabel.centerXAnchor),
            highLowLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            highLowLabel.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor),
            degreeLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor),
            degreeLabel.topAnchor.constraint(equalTo: temperatureLabel.topAnchor,constant: 8),
            ]
        NSLayoutConstraint.activate(constraints)
    }
    func populateSubviews() {
        locationLabel.text = "Краснодарский край"
        shortForcastLabel.text = "Солнечно"
        temperatureLabel.text = "27"
        highLowLabel.text = "H:35  L:18"
    }
    
    //MARK:Instance methods
    
    
    
}
