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
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //register headers
        collectionView.register(TodayHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: TodayHeader.reuseIdentifier)
        
        //register footers
        collectionView.register(TodayFooter.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: TodayFooter.reuseIdentifier)
        //register Cells
        collectionView.register(TestCell.self, forCellWithReuseIdentifier: TestCell.className)
     
        //layout setup
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        //pin collection view to the top of the view
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            
        }
    
    }

}
