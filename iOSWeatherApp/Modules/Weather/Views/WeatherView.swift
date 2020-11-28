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
        makeCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Instance methods
    private func makeCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: WeatherFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        //constraint collection view
        self.setSubviewForAutoLayout(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        //register headers
        collectionView.registerHeaders(TodayHeader.self)
        //register footers
        collectionView.registerFooters(TodayFooter.self)
        //register Cells
        collectionView.registerCells(TestCell.self)
        //layout setup
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
           
        }
        //pin collection view to the top of the view
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            
        }
       
    
    }

}
