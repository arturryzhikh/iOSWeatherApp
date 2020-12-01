//
//  TestHeader.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

class TodayHeader: UICollectionViewCell {
    //MARK: Static  Properties
    static var defaultHeight: CGFloat {
        Screen.height * 0.448
    }
    static var minimumHeight: CGFloat {
        defaultHeight / 2
    }
    //MARK: Other Properties
    
    //MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
    //MARK: Subviews
    private let locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Coceнское"
        
        lbl.backgroundColor = .blue
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.045).rounded(), weight: .regular)
        lbl.textColor = .white
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let weatherOverViewLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .cyan
        lbl.textColor = .white
        lbl.text = "Переменная облачность"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.03).rounded(),weight: .ultraLight)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.backgroundColor = .green
        lbl.text = "9"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.111).rounded(),weight: .light)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    private let highLowLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .darkGray
        lbl.textColor = .white
        lbl.text = "H: 12° L: -5°"
        lbl.font = UIFont.systemFont(ofSize: (Screen.height * 0.02).rounded(),weight: .light)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    //MARK:Instance methods
    private func addConstraints() {
        self.addSubviewsForAutoLayout([locationLabel,weatherOverViewLabel,temperatureLabel,highLowLabel])
        let topPadding =  self.frame.size.height * 0.25
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: topPadding),
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //overview label
            weatherOverViewLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            weatherOverViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weatherOverViewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //temperature label
            temperatureLabel.topAnchor.constraint(equalTo: weatherOverViewLabel.bottomAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //hight low label
            highLowLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            highLowLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            highLowLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    
}
