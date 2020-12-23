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
        addConstraints()
        pageControlBar.addSeparator(to: .top,aboveSubview: pageControl)
    }
  
    //MARK: Instance methods
    private func addConstraints() {
        //add subviews
        addSubviewsForAutoLayout([backgroundImageView,collectionView,pageControlBar])
        //Autolayout
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
            //page control
            pageControl.centerXAnchor.constraint(equalTo: pageControlBar.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: pageControlBar.topAnchor,constant: 10),
            //collection view
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControlBar.topAnchor)
        ])
    }
    //MARK: Subviews:
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
        v.addSubviewsForAutoLayout([pageControl])
        return v
    }()
    //Page Controle
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 4
        return pc
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


