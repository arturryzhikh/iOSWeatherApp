//
//  HourlyWeatherCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

final class HourlyWeatherCell: ClearCell, Customizable , DataDriven {
  
    //MARK: Life Cycle
    override func setup() {
       addSubviewForAutoLayout(vStack)
        setupConstraints()
        populateSubviews()
       
        
    }
    //MARK: Subviews
    private lazy var vStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews:[ hourLabel,
                             weatherEmojiLabel,
                             temperatureLabel])
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = 2
        return sv
        
    }()
    let hourLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let weatherEmojiLabel: UILabel = {
        let lbl = UILabel(font: .weatherEmoji)
        return lbl
    }()
    func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    func populateSubviews() {
        hourLabel.text = "27"
        weatherEmojiLabel.text = "🌦"
        temperatureLabel.text = "27°"
        
    }
    
  
    
}
