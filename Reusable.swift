//
//  DataDriven.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

protocol Reusable: UICollectionReusableView {
    
    associatedtype ViewModel = ItemViewModelProtocol
    
    var viewModel: ViewModel? { get set }
    
    func populateSubviews(with viewModel: ViewModel)
    
}

