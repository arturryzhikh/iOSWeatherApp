//
//  HourlyWeatherCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit

final class HourlyWeatherCell: ClearCell {
    //MARK: Life Cycle
    override func initialSetup() {
        super.initialSetup()
    }
    //MARK: Subviews
    private let hourLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel(font: .regularTemperature)
        return lbl
    }()
    private let weatherImageView: UIImageView = {
        let iv = UIImageView()
        //FIXME: Hardcoded image name
        iv.image = UIImage(named: "background")
        iv.contentMode = .scaleToFill
        return iv
    }()
}
