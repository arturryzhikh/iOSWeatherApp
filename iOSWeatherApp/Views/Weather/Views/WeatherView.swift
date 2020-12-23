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
        addSubviewsForAutoLayout([backgroundImageView,collectionView,pageControlBar,line])
        addConstraints()
        
    }
    
    //MARK: Instance methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            //weather image view
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            //page control bar
            pageControlBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControlBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControlBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            pageControlBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.085),
            //white line above page control bar
            line.leadingAnchor.constraint(equalTo: pageControlBar.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: pageControlBar.trailingAnchor),
            line.heightAnchor.constraint(equalToConstant: 1 / Screen.scale),
            line.topAnchor.constraint(equalTo: pageControlBar.topAnchor),
            //collection view
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControlBar.topAnchor)
        ])
    }
    //MARK: Subviews:
    private let line: UIView =  {
        let v = UIView()
        v.backgroundColor = .weatherWhite
        return v
    }()
    //background
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        //FIXME: Hardcoded image name
        //        iv.image = UIImage(named: "background")
        iv.backgroundColor = .gray
        iv.contentMode = .scaleToFill
        return iv
    }()
    //Page Control Bar
    private lazy var pageControlBar: UIView =  {
        let v = UIView()
        return v
    }()
    //create collection view
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: WeatherFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerHeaders(TodayHeader.self)
        collectionView.registerFooters(TodayFooter.self)
        collectionView.registerCells(DailyWeatherCell.self,
                                     WeatherOverViewCell.self,
                                     ExtendedInfoCell.self,
                                     WeatherLinkCell.self)
        return collectionView
    }()
    
}


