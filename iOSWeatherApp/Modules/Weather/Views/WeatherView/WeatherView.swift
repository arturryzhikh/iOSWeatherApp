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
    }
  
    //MARK: Instance methods
    private func addConstraints() {
        //add subviews
        addSubviewsForAutoLayout([collectionView,pageControlBar])
        //Autolayout
        NSLayoutConstraint.activate([
            //page control bar
            pageControlBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControlBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControlBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            pageControlBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.085),
            //line view
            line.leadingAnchor.constraint(equalTo: pageControlBar.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: pageControlBar.trailingAnchor),
            line.topAnchor.constraint(equalTo: pageControlBar.topAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
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
    //Page Control Bar
    private lazy var pageControlBar: UIView =  {
        let v = UIView()
        v.addSubviewsForAutoLayout([pageControl,line])//add subviews above so the could be visible
        return v
    }()
    //Top line
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .white
        return line
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
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerHeaders(TodayHeader.self)
        collectionView.registerFooters(TodayFooter.self)
        collectionView.registerCells(TestCell.self)
        return collectionView
    }()
    
}


