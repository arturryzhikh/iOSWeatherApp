//
//  WeatherFlowLayout.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 08.11.2020.
//

import UIKit

final class WeatherFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        printFunction()
        self.scrollDirection = .vertical
    }
}
