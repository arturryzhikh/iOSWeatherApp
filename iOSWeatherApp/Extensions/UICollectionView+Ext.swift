//
//  UICollectionView+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 29.11.2020.
//

import UIKit

extension UICollectionView {
    
    func registerCells(_ cellClasses: AnyClass...)  {
        cellClasses.forEach {
            register($0, forCellWithReuseIdentifier: $0.description())
        }
    }
    func registerHeaders(_ headers: AnyClass...) {
        headers.forEach {
            register($0, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                     withReuseIdentifier: $0.description())
        }
    }
    func registerFooters(_ footers: AnyClass...) {
        footers.forEach {
            register($0, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                     withReuseIdentifier: $0.description())
        }
    }
    
    
}

