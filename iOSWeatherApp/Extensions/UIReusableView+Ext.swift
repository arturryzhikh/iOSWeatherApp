//
//  ReuseIdentifyable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//
import UIKit

enum SupplementaryViewKind {
    case header
    case footer
}

extension UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return Self.description()
    }
    static func kind(_ kind : SupplementaryViewKind) -> String {
        switch kind {
        case .header:
            return UICollectionView.elementKindSectionHeader
        case .footer:
            return UICollectionView.elementKindSectionFooter
        }
    }
   
}


