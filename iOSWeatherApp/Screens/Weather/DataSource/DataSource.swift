//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//

import UIKit

final class DataSource: NSObject  {
    
    private var collectionView: UICollectionView!
    init(of collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        collectionView.dataSource = self
        collectionView.registerHeaders(TodayHeader.self)
        collectionView.registerFooters(TodayFooter.self)
        collectionView.registerCells(DailyWeatherCell.self,
                                     WeatherOverViewCell.self,
                                     ExtendedInfoCell.self
                                     ,WeatherLinkCell.self)
    }
    
}

extension DataSource: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return 9
        case 2:
            return 1
        case 3:
            return 10
        case 4:
            return 1
        default:
            fatalError("No data for number of items for this section \(section)")
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        let section = indexPath.section
        switch section {
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyWeatherCell.description(), for: indexPath) as! DailyWeatherCell
            return cell
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherOverViewCell.description(), for: indexPath) as! WeatherOverViewCell
            return cell
        case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtendedInfoCell.description(), for: indexPath) as! ExtendedInfoCell
            return cell
        case 4:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherLinkCell.description(), for: indexPath) as! WeatherLinkCell
            return cell
        default:
           fatalError("No appropriate cell type for this section: \(section)")
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TodayHeader.description(), for: indexPath) as? TodayHeader else {
                fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
                
            }
            return header
            
            
        case UICollectionView.elementKindSectionFooter :
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TodayFooter.description(), for: indexPath) as? TodayFooter else {
                fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
            }
            
            
            return footer
        default:
            fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
        }
    }
 }
