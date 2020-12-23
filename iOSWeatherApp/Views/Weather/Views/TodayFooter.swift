//
//  TestFooter.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class TodayFooter: ClearCell, UICollectionViewDelegate {
    //MAKR: Static properties
    static var defaultHeight: CGFloat {
        Screen.height * 0.143
    }
    //MARK: Subviews
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCells(HourlyWeatherCell.self)
        let horizontalInset = Screen.width * 0.05
        collectionView.contentInset = UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = horizontalInset
            layout.minimumInteritemSpacing = 0
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
        }
        return collectionView
    }()
    
    //MARK: Other Properties
    //MARK: Life cycle
    override func setup() {
        addSubviewForAutoLayout(collectionView)
        addSeparator(to: .top, aboveSubview: collectionView)
        addSeparator(to: .bottom, aboveSubview: collectionView)
        setupConstraints()
        
        
    }
    //MARK:Instance methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
////MARK: DataSource
extension TodayFooter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCell.description(), for: indexPath) as! HourlyWeatherCell
        if indexPath.item == 3 {
            cell.hourLabel.text = "Восход Солнца"
            
        }
        return cell
    }
    
    
}
//MARK: Delegate Flow Layout
extension TodayFooter: UICollectionViewDelegateFlowLayout {
    
}
