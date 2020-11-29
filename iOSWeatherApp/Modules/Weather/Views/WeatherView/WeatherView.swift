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
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Instance methods
    // create page controll bar
    private func addConstraints() {
        //add subviews
        addSubviewsForAutoLayout(collectionView,pageControlBar)
        //Autolayout
        NSLayoutConstraint.activate([
            //page control bar
            pageControlBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControlBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControlBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            pageControlBar.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.08),
            //line view
            line.leadingAnchor.constraint(equalTo: pageControlBar.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: pageControlBar.trailingAnchor),
            line.topAnchor.constraint(equalTo: pageControlBar.topAnchor),
            line.heightAnchor.constraint(equalToConstant: 1 * Screen.scale),
            //page control
            pageControl.centerXAnchor.constraint(equalTo: pageControlBar.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: pageControlBar.centerYAnchor),
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
        v.addSubviewsForAutoLayout(pageControl,line)//add subviews above so the could be visible and interactiable
        v.backgroundColor = .darkText
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
        //create
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: WeatherFlowLayout())
        //check if layout is flow
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            //layout setup
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
        collectionView.showsVerticalScrollIndicator = false // hide indicator
        //register headers
        collectionView.registerHeaders(TodayHeader.self)
        //register footers
        collectionView.registerFooters(TodayFooter.self)
        //register Cells
        collectionView.registerCells(HourlyForecastCell.self)
        //pin collection view to the top of the view
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
            //FIXME: - Fallback to earlier versions
        } else {
            
        }
        return collectionView
    }()
    
}


