//
//  WeatherView.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class WeatherView: UIView {
    //MARK: Other Properties
    
    //MARK: Life Cycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsForAutoLayout([backgroundImage,collectionView,pageControlBar,line])
        activateConstraints()
        
        
    }
    
    //MARK: Instance methods
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            //background image
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            //page control bar
            pageControlBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControlBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControlBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            pageControlBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07),
            //white line above page control bar
            line.leadingAnchor.constraint(equalTo: pageControlBar.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: pageControlBar.trailingAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.75),
            line.topAnchor.constraint(equalTo: pageControlBar.topAnchor),
            //collection view
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControlBar.topAnchor)
        ])
    }
    //MARK: Subviews:
    private let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "background")
        return iv
    }()
    private let line: UIView =  {
        let v = UIView()
        v.backgroundColor = .weatherWhite
        return v
    }()
    //Page Control Bar
    private lazy var pageControlBar: UIView =  {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    //create collection view
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: WeatherFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerHeaders(CurrentWeatherHeader.self)
        collectionView.registerFooters(HourlyWeatherFooter.self)
        collectionView.registerCells(DailyItemCell.self, WeatherOverViewCell.self, ExtendedInfoCell.self, WeatherLinkCell.self)
        return collectionView
    }()
    
}


