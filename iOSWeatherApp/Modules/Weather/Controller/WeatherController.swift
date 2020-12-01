//
//  ViewController.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.10.2020.
//

import UIKit

final class WeatherController: UIViewController {
    //MARK: Subviews
    private var weatherView: WeatherView {
        return self.view as! WeatherView
    }
    private var collectionView: UICollectionView  {
        return weatherView.collectionView
    }
    //MARK: Other Properties
    private var viewModel = ViewModel()
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

//MARK: UICollectionViewDataSource
extension WeatherController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numbersOfSections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsIn(section: section)
    }
    //Setup Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCell.description(), for: indexPath) as! HourlyForecastCell
        cell.label.text = "Section: \(indexPath.section) Item: \(indexPath.item)"
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
            fatalError("No such kind of supplementary view, kind is: \(kind)")
        }
    }
}

//MARK: UICollectionViewDelegateFlowLayout
 extension WeatherController: UICollectionViewDelegateFlowLayout {
    //item size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        let width = Screen.width * 0.9
        let height = Screen.height
        switch section {
        case 1:
            return CGSize(width: width , height: (height * 0.066).rounded())
        case 2:
            return CGSize(width: width, height: (height * 0.131).rounded())
        case 3:
            return CGSize(width: width, height: (height * 0.073).rounded())
        case 4:
            return CGSize(width: width, height: (height * 0.052).rounded())
        default:
           fatalError("No appropriate size for this indexPath")
        }
       
    }
   //header size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerSize = CGSize(width: Screen.width, height: TodayHeader.defaultHeight)
        return section == 0 ? headerSize : .zero
    }
    //footer size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerSize =  CGSize(width: Screen.width, height: TodayFooter.defaultHeight)
        return section == 0 ? footerSize : .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        -1 * Screen.scale
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


