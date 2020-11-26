//
//  TestLayout.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//

import UIKit

final class WeatherFlowLayout: UICollectionViewFlowLayout {
    
    private var attributesCache: [UICollectionViewLayoutAttributes] = []
    override func prepare() {
        super.prepare()
        attributesCache = [] //clear cache
        guard let collectionView = collectionView else { return }
        // Add all item in sections into attributes
        let numberOfSections = collectionView.numberOfSections
        for section in 0..<numberOfSections {
            let headerIndexPath = IndexPath(item: 0, section: section)
            if let headerAttribute = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: headerIndexPath)?.copy() {
                attributesCache.append(headerAttribute as! UICollectionViewLayoutAttributes)
            }
            if let footerAttribute = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, at: headerIndexPath)?.copy() {
                attributesCache.append(footerAttribute as! UICollectionViewLayoutAttributes)
            }
            let numberOfItems = collectionView.numberOfItems(inSection: section)
            for item in 0..<numberOfItems {
                let indexPath = IndexPath(item: item, section: section)
                if let attribute = layoutAttributesForItem(at: indexPath)?.copy() {
                    attributesCache.append(attribute as! UICollectionViewLayoutAttributes)
                }
            }
        }
    }
    
    // Telling our UICollectionViewLayout that it should be updating the layout while scrolling
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // We’ll use this constantly updating method to configure header and cell behaviours
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // Scroll offset
        let offset = collectionView?.contentOffset ?? CGPoint.zero
        
        // get all headers
        let headersAttributes = attributesCache.filter { attribute -> Bool in
            return attribute.representedElementKind == UICollectionView.elementKindSectionHeader
        }
        let footersAttributes = attributesCache.filter { (attribute) -> Bool in
            attribute.representedElementKind == UICollectionView.elementKindSectionFooter
        }
        guard let header = headersAttributes.first, let footer = footersAttributes.first else { return nil }
        
        // setup header in first section
        let headerDefaultSize = header.frame.size
        header.frame.size.height = max(150, headerDefaultSize.height - offset.y)
        header.frame.origin.y = offset.y
        
        // setup footer in  first section
        footer.frame.origin.y = header.frame.origin.y + header.frame.size.height
        return attributesCache
    }
  
    
    
}
