//
//  ViewController.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.10.2020.
//

import UIKit

final class WeatherController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: Other Properties
    private var width: CGFloat {
        return collectionView.frame.width
    }
    
    //MARK: Subviews
    private var weatherView: WeatherView {
        return self.view as! WeatherView
    }
    
    private var collectionView: UICollectionView!  {
        return weatherView.collectionView
    }
    //MARK: Other Properties
    private var dataProvider: DataSource!
    //MARK: Life Cycle
    override func loadView() {
        view = WeatherView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        dataProvider = DataSource()
    }
   
    
}
//MARK: UICollectionViewDelegateFlowLayout
extension WeatherController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        printFunction(items: indexPath)
    }
    //item size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        let partialWidth = width * 0.9
        let height = Screen.height
        switch section {
        case 1:
            return CGSize(width: partialWidth , height: (height * 0.066))
        case 2:
            return CGSize(width: partialWidth, height: (height * 0.131))
        case 3:
            return CGSize(width: partialWidth, height: (height * 0.07))
        case 4:
            return CGSize(width: width, height: (height * 0.09))
        default:
            return .zero
        }
        
    }
    
    //header size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerSize = CGSize(width: width, height: CurrentWeatherCell.defaultHeight)
        return section == 0 ? headerSize : .zero
    }
    //footer size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerSize =  CGSize(width: width, height: HourlySectionCell.defaultHeight)
        return section == 0 ? footerSize : .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
}


//MARK: UICollectionViewDataSource
extension WeatherController: UICollectionViewDataSource {
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
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CurrentWeatherCell.description(), for: indexPath) as? CurrentWeatherCell else {
                fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
                
            }
            return header
            
            
        case UICollectionView.elementKindSectionFooter :
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HourlySectionCell.description(), for: indexPath) as? HourlySectionCell else {
                fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
            }
            
            
            return footer
        default:
            fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
        }
    }
 }
