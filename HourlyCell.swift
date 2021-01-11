//
//  HourlyWeatherCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

final class HourlyCell: ClearCell ,Reusable {
    
    var viewModel: HourlyItemViewModel? {
        didSet {
           
            if let vm = viewModel {
                populateSubviews(with: vm)
            }
        }
    }
    
    func populateSubviews(with viewModel: HourlyItemViewModel) {
        hourLabel.text = viewModel.hour
        weatherEmojiLabel.text = viewModel.weatherEmoji
        temperatureLabel.text = viewModel.temperature
    }
    
    
    //MARK: Life Cycle
    override func setup() {
        super.setup()
        addSubviewForAutoLayout(vStack)
        activateConstraints()
        
        
    }
    //MARK: Subviews
    private lazy var vStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            hourLabel,
            weatherEmojiLabel,
            temperatureLabel
        ])
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = 4
        return sv
        
    }()
    let hourLabel: UILabel = {
        let lbl = UILabel(font: .lightTemperature)
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
    override func activateConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
