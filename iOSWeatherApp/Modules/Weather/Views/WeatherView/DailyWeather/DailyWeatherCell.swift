//
//  MyCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

final class DailyWeatherCell: ClearCell, Customizable, DataDriven {
    //MARK: Other properties
  
    //MARK: Subviews
    let dayLabel: UILabel = {
        let lbl = UILabel(font: .day)
        return lbl
    }()
    private let temperatureHighLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let temperatureLowLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        lbl.textColor = .weatherTransparent
        return lbl
    }()
    private let weatherEmojiLabel: UILabel = {
        let lbl = UILabel(font: .weatherEmoji)
        return lbl
    }()
    private let percentageLabel: UILabel = {
        let lbl = UILabel(font: .percentage)
        lbl.textColor = .percentage
        return lbl
    }()
    private lazy var weatherEmojiStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews:[weatherEmojiLabel,percentageLabel])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = Screen.width * 0.025
        return sv
    }()
    private lazy var temperatureStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews:[temperatureHighLabel,temperatureLowLabel])
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = Screen.width * 0.05
        return sv
        
    }()
   //MARK: life Cycle
    override func setup() {
        populateSubviews()
        addSubviewsForAutoLayout([dayLabel,weatherEmojiStack,temperatureStack])
        setupConstraints()
      
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherEmojiStack.leadingAnchor.constraint(equalTo: centerXAnchor),
            weatherEmojiStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            temperatureStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperatureStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
        
    }
    func populateSubviews() {
        dayLabel.text = "Воскресенье"
        temperatureHighLabel.text = "28"
        temperatureLowLabel.text = "22"
        weatherEmojiLabel.text = "☀️"
        percentageLabel.text = "47%"
    }
    

    
    
   
}
