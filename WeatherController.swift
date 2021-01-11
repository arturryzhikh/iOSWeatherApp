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
    private var dataSource: WeatherDataSource!
    //MARK: Life Cycle
    override func loadView() {
        view = WeatherView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        dataSource = WeatherDataSource()
        dataSource.getWeatherWith(WeatherRequest(latitude: 55.751244, longitude: 37.618423))
        dataSource.reloadClosure = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
}


//MARK: UICollectionViewDelegateFlowLayout
extension WeatherController: UICollectionViewDelegateFlowLayout {
   
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
        let headerSize = CGSize(width: width, height: CurrentHeader.defaultHeight)
        return section == 0 ? headerSize : .zero
    }
    //footer size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerSize =  CGSize(width: width, height: HourlyFooter.defaultHeight)
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
        return dataSource.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.numberOfItemsIn(section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let section = Section(rawValue: indexPath.section)
        switch section {
        
        
        
        case .daily:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCell.description(), for: indexPath) as! DailyCell
            cell.viewModel = dataSource.dailySectionVM?.items?[indexPath.item]
            return cell
            
        case .today:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.description(), for: indexPath) as! TodayCell
            cell.viewModel = dataSource.todaySectionVM?.items?[indexPath.item]
            return cell
            
       case .detail:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.description(), for: indexPath) as! DetailCell
            let vm = dataSource.detailSectionVM?.items?[indexPath.item]
            cell.viewModel = vm
            return cell
        
        case .link:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LinkCell.description(), for: indexPath) as! LinkCell
            return cell
            
        default:
            assert(false)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        
        case UICollectionView.elementKindSectionHeader :
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CurrentHeader.description(), for: indexPath) as? CurrentHeader else {
                fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
            }
            let vm = dataSource.currentHourlySectionVM?.header
            header.viewModel = vm
            return header
            
        case UICollectionView.elementKindSectionFooter :
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HourlyFooter.description(), for: indexPath) as? HourlyFooter else {
                fatalError("No appropriate view for supplementary view of \(kind) ad \(indexPath)")
            }
            let vm = dataSource.currentHourlySectionVM?.footer
            footer.viewModel = vm
            return footer
            
        default:
            assert(false)
        }
    }
}
