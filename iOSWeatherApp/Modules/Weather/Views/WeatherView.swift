//
//  WeatherView.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class WeatherView: UIView {
    //MARK: Properties
    var collectionView: UICollectionView!
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCollectionView(layout: WeatherFlowLayout())
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Instance methods
    private func makeCollectionView(layout: UICollectionViewFlowLayout) {
        //create
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //check if layout is flow
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            assert(false,"Collection View layout object is not a subclass of UICollectionViewFlowLayout")
        }
        collectionView.showsVerticalScrollIndicator = false // hide indicator
        layoutCollectionView()
        //register headers
        collectionView.registerHeaders(TodayHeader.self)
        //register footers
        collectionView.registerFooters(TodayFooter.self)
        //register Cells
        collectionView.registerCells(TestCell.self)
        //layout setup
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //pin collection view to the top of the view
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        //FIXME: - Fallback to earlier versions
        } else {
            
        }
    }
    private func layoutCollectionView() {
        self.setSubviewForAutoLayout(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

