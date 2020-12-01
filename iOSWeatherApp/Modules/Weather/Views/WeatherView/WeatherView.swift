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
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Instance methods
    // create page controll bar
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
            line.heightAnchor.constraint(equalToConstant: 1 * Screen.scale),
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
        v.addSubviewsForAutoLayout([pageControl,line])//add subviews above so the could be visible and interactiable
        //FIXME: test background color
        v.backgroundColor = #colorLiteral(red: 0.5306975654, green: 0.3500108371, blue: 0.7565638628, alpha: 1)
        return v
    }()
    //Top line
    private let line: UIView = {
        let line = UIView()
        //FIXME: test background color
        line.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
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
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: WeatherFlowLayout())
        //FIXME: test background color
        collectionView.backgroundColor = .white
        // hide indicator
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
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


