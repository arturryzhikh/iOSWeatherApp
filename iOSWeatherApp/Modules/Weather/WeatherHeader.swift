//
//  WeatherHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 07.11.2020.
//

import UIKit

final class WeatherHeader: UICollectionReusableView {
    
    //MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
//        setupSubviews()
    }
    static var kind: String = UICollectionView.elementKindSectionHeader
    //MARK: Subviews
    private let cityLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Новороссийск"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textColor = .lightGray
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let weatherOverViewLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "Облачно"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "9"
        lbl.font = UIFont.boldSystemFont(ofSize: 60)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private lazy var highLowStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [highLabel,lowLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        return stack
    }()
    private let highLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "H:12"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        return lbl
    }()
    private let lowLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "L:7"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private func setupSubviews() {
        let padding: CGFloat = 2
        
        self.setSubviewsForAutoLayout([cityLabel,
                                       weatherOverViewLabel,
                                       temperatureLabel,
                                       highLowStack])
        
        NSLayoutConstraint.activate([
            //Constraint city label
            cityLabel.topAnchor.constraint(equalTo: topAnchor,constant: 32),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //Constraint weather overview label
            weatherOverViewLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: padding),
            weatherOverViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherOverViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //Constraint temperature label
            temperatureLabel.topAnchor.constraint(equalTo: weatherOverViewLabel.bottomAnchor,constant: padding),
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //Constraint hithLowStackView
            highLowStack.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor,constant: padding),
            highLowStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            highLowStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
