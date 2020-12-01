//
//  MyCell.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//

import UIKit

final class HourlyForecastCell: UICollectionViewCell {
    
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        backgroundColor = .red
        label = UILabel()
        addSubviewForAutoLayout(label)
        //constraint label
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
        ])
        label.textColor = .black
        label.textAlignment = .center
    }
}
