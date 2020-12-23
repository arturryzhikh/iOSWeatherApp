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
    private let collectionView: UICollectionView = {
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
         collectionView.backgroundColor = .clear
         collectionView.showsVerticalScrollIndicator = false
         collectionView.showsHorizontalScrollIndicator = false
        return collectionView
     }()
     
    //MARK: Other Properties
    //MARK: Life cycle
    override func setup() {
        addSubviewForAutoLayout(collectionView)
        addSeparator(to: .top, aboveSubview: collectionView)
        addSeparator(to: .bottom, aboveSubview: collectionView)
        setupConstraints()
//        collectionView.delegate = self
//        collectionView.dataSource = self
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
//extension TodayFooter: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return UICollectionViewCell()
//    }
//
//
//}
////MARK: Delegate Flow Layout
//extension UICollectionViewDelegate {
//
//}
