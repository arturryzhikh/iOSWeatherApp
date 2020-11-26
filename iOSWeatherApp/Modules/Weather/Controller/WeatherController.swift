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
    
    private var collectionView: UICollectionView {
        return weatherView.collectionView
    }
    //MARK: Other Properties
    
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
        7
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        default:
            return 10
        }
    }
    //Setup Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCell.className, for: indexPath) as! TestCell
        let section = indexPath.section
        var backgroundColor: UIColor {
            switch section {
            case 1: return .red
            case 2: return .green
            case 3: return .brown
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
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: TestHeader.kind,
                                                                         withReuseIdentifier: TestHeader.className,
                                                                         for: indexPath)     as! TestHeader
            header.backgroundColor = .yellow
            return header
        case UICollectionView.elementKindSectionFooter :
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: TestFooter.kind,
                                                                         withReuseIdentifier: TestFooter.className,
                                                                         for: indexPath) as! TestFooter
            footer.backgroundColor = .green
            return footer
        default:
            fatalError("No such kind of supplementary view, kind is: \(kind)")
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
        case 0:
            return CGSize(width: collectionView.frame.width - 50 , height: 100)
            
        default:
            return CGSize(width: collectionView.frame.width - 100 , height: 100)
        }
       
    }
    //header size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: collectionView.frame.width, height: 300) : .zero
    }
    //footer size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: collectionView.frame.width, height: 150) : .zero
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


