//
//  DataSourceCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 21.12.2020.
//

import UIKit


protocol DataSourceCell: UICollectionViewCell {
    var viewModel: Any? { get set }
    func populateSubviews()
    func initialSetup()
}
