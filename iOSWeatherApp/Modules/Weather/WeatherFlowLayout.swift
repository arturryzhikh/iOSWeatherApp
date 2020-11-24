//
//  WeatherLayout.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 15.11.2020.
//
public struct Window {
    
    static var frame: CGRect {
        UIScreen.main.bounds
    }
    static var width: CGFloat {
        return Window.frame.width
    }
    static var height: CGFloat {
        return Window.frame.height
    }
    static var origin: CGPoint {
        return Window.frame.origin
    }
    
}
import UIKit

final class WeatherFlowLayout: UICollectionViewFlowLayout {
    //storage for layout attributes
    private var attributes: [UICollectionViewLayoutAttributes] = []
    //
    override func prepare() {
        super.prepare()
        attributes.removeAll()
        guard let collectionView = collectionView else { return }
        for section in 0..<collectionView.numberOfSections {
            let headerIndexPath = IndexPath(item: 0, section: section)
            if let headerAttribute = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                          at: headerIndexPath)?.copy() {
                attributes.append(headerAttribute as! UICollectionViewLayoutAttributes)
            }
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                if let attribute = layoutAttributesForItem(at: indexPath)?.copy() {
                    attributes.append(attribute as! UICollectionViewLayoutAttributes)
                }
            }
        }
    }
    
    //  UICollectionViewLayout  should be updating the layout while scrolling
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let yOffset = collectionView?.contentOffset.y ?? 0
        
        
        let headers = attributes.filter { attribute -> Bool in
            return attribute.representedElementKind == UICollectionView.elementKindSectionHeader
        }
        guard let topHeader = headers.first, let secondHeader = headers.last else { return nil }
        
        
        let topHeaderDefaulHeight:CGFloat = 300.0
        topHeader.frame.size.height = max(150, topHeaderDefaulHeight - yOffset)
        topHeader.frame.origin.y = yOffset
        
        
        secondHeader.frame.origin.y = topHeader.frame.origin.y + topHeader.frame.size.height
        
        
//        let cells = attributes.filter { (attribute) -> Bool in
//            return (attribute.representedElementKind != UICollectionView.elementKindSectionHeader)
//                &&  (attribute.representedElementKind != UICollectionView.elementKindSectionFooter)
//        }
//        
//        
//        let limit = secondHeader.frame.origin.y + secondHeader.frame.size.height
//        for oneCell in cells {
//            oneCell.frame.origin.y = limit
//        }
//        
        
      
        return attributes
    }
    
    
    
}
//let header = cache.filter { $0.representedElementKind == UICollectionView.elementKindSectionHeader}.first
//let headerDefaultSize: CGFloat = 300
//header?.frame.size.height =  max(150, headerDefaultSize - yOffset)
//header?.frame.origin.y = yOffset
