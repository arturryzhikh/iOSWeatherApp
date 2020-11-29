//
//  ViewController.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.10.2020.
//

import UIKit
import CoreLocation
final class WeatherController: UIViewController {
    //MARK: Subviews
    private var weatherView: WeatherView {
        return self.view as! WeatherView
    }
    private var collectionView: UICollectionView  {
        return weatherView.collectionView
    }
    //MARK: Other Properties
    private var collectionViewWidth: CGFloat {
        return collectionView.frame.width
    }
    
    //MARK: Life Cycle
    override func loadView() {
        view = WeatherView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: Instance methods

extension WeatherController {
    
}

//MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension WeatherController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
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
            assert(false, "Wrong number of items in section")
        }
    }
    //Setup Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCell.description(), for: indexPath) as! HourlyForecastCell
        let section = indexPath.section
        var backgroundColor: UIColor {
            switch section {
            case 1: return .red
            case 2: return .green
            case 3: return .blue
            case 4: return .darkGray
            case 5: return .magenta
            case 6: return .yellow
            default: return .cyan
            }
        }
        cell.label.text = "Section: \(indexPath.section) Item: \(indexPath.item)"
        cell.backgroundColor = backgroundColor
        return cell
    }
    //Setup Headers / Footers
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: TodayHeader.description(),
                                                                         for: indexPath) as! TodayHeader
            header.backgroundColor = .gray
            return header
        case UICollectionView.elementKindSectionFooter :
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: TodayFooter.description(),
                                                                         for: indexPath) as! TodayFooter
            
            footer.backgroundColor = .brown
            return footer
        default:
            assert(false,"No such kind of supplementary view, kind is: \(kind)")
        }
    }
    
    
}
//MARK: UICollectionViewDelegateFlowLayout
    //item size
extension WeatherController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 1:
            return CGSize(width: collectionViewWidth, height: Screen.height * 0.327 / 9)
        case 2:
            return CGSize(width: collectionViewWidth, height: Screen.height * 0.130)
        case 3:
            return CGSize(width: collectionViewWidth, height: Screen.height * 0.07)
        case 4:
            return CGSize(width: collectionViewWidth, height: Screen.height * 0.052)
        default:
            assert(false, "No appropriate size for this indexPath")
        }
       
    }
   //header size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerSize = CGSize(width: collectionViewWidth, height: TodayHeader.defaultHeight)
        return section == 0 ? headerSize : .zero
    }
    //footer size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerSize =  CGSize(width: collectionViewWidth, height: TodayFooter.defaultHeight)
        return section == 0 ? footerSize : .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


//MARK: SwiftUI Preview
#if DEBUG
import SwiftUI
struct WeatherControllerContainerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = WeatherController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return WeatherController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct ContentViewController_Previews: PreviewProvider {
    static var previews: some View {
        WeatherControllerContainerView().previewDisplayName("iPhone 12 Pro").edgesIgnoringSafeArea(.all)
    }
}

#endif


