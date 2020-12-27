//
//  TestHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class CurrentWeatherCell: ClearCell, Customizable, Reusable {
    
    var viewModel: CurrentVM? {
        didSet {
            configureWith(viewModel)
        }
    }
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
        return max((frame.height - transparentY) / (CurrentWeatherCell.defaultHeight - transparentY), 0)
    }
    private var topConstraint: NSLayoutConstraint?
    private var topPadding: CGFloat {
        return frame.height * 0.3
    }
    //MARK: Life cycle
    override func setup() {
        super.setup()
        addSubviewsForAutoLayout([
            locationLabel,
            descriptionLabel,
            temperatureLabel,
            highLowLabel,
            
            
        ])
        setupConstraints()
        reset()
        
    }
    override func layoutSubviews() {
        //update top constraint because origin of view changes during scrolling
        topConstraint?.constant = topPadding
        highLowLabel.alpha = computedAlpha
        temperatureLabel.alpha = computedAlpha
        
    }
    //MARK: Subviews
    let locationLabel: UILabel = {
        let lbl = UILabel(transparentText: false,font: .locationLabel)
        return lbl
    }()
    private let descriptionLabel: UILabel = {
        let lbl = UILabel(font: .lightTemperature)
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel(font: .hugeTemperature)
        return lbl
    }()
    
    private let highLowLabel: UILabel = {
        let lbl = UILabel(font: .lightTemperature)
        return lbl
    }()
  
    func setupConstraints() {
        topConstraint = locationLabel.topAnchor.constraint(equalTo: topAnchor,constant: topPadding)
        topConstraint?.isActive = true
        let constraints = [
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: locationLabel.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: descriptionLabel.centerXAnchor),
            highLowLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            highLowLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
           
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    func reset() {
        locationLabel.text = nil
        descriptionLabel.text = nil
        temperatureLabel.text = nil
        highLowLabel.text = nil
        
        
    }
    
    func configureWith(_ vm: CurrentVM?) {
        guard let vm = vm else {
            printFunction(items: "CurrenViewModel is NIL")
            return
        }
        locationLabel.text = vm.location
        descriptionLabel.text = vm.description
        temperatureLabel.text = vm.temperature
        highLowLabel.text = vm.highLowTemp

        
    }
    func populateSubviews() {
        
        
    }
    
    //MARK:Instance methods
    
    
    
}
