//
//  MyCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

final class DailyItemCell: ClearCell, Reusable {
    
    
    
    var viewModel: DailyWeatherViewModel? {
        didSet {
            if let vm = viewModel {
                populateSubviews(with: vm)
            }
        }
    }
    
    func populateSubviews(with viewModel: DailyWeatherViewModel) {
        dayLabel.text = viewModel.day
        temperatureHighLabel.text = viewModel.temperatureHigh
        temperatureLowLabel.text = viewModel.temperatureLow
        weatherEmojiLabel.text = viewModel.weatherEmoji
        percentageLabel.text = viewModel.percentage
    }
    //MARK: Other properties
    
    //MARK: Subviews
    let dayLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let temperatureHighLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let temperatureLowLabel: UILabel = {
        let lbl = UILabel(font: .lightTemperature)
        lbl.textColor = .weatherTransparent
        return lbl
    }()
    private let weatherEmojiLabel: UILabel = {
        let lbl = UILabel(font: .weatherEmoji)
        return lbl
    }()
    private let percentageLabel: UILabel = {
        let lbl = UILabel(font: .extendedInfoTitle)
        lbl.textColor = .percentage
        return lbl
    }()
    private lazy var weatherEmojiStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews:[weatherEmojiLabel,percentageLabel])
        sv.axis = .horizontal
        sv.alignment = .fill
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
        super.setup()
        addSubviewsForAutoLayout([dayLabel,weatherEmojiStack,temperatureStack])
        activateConstraints()
        
        
    }
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherEmojiStack.leadingAnchor.constraint(equalTo: centerXAnchor,constant: -Screen.width * 0.1),
            weatherEmojiStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            temperatureStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperatureStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
 
}
