//
//  ViewController.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.10.2020.
//

import UIKit

final class WeatherController: UIViewController {
   
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: WeatherFlowLayout())
        collectionView.backgroundColor = .yellow
        collectionView.showsVerticalScrollIndicator = false
        //constraint collection view
        view.setSubviewForAutoLayout(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //register reusable views
        collectionView.register(WeatherHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherHeader.className)
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.className)
        //set delegate & data source
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        //setup layout
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 200)
            
            
        }
        print(collectionView.numberOfItems(inSection: 0))
        
       
        
        
    }
    
    
    
}

extension WeatherController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
           return  1
        default:
           return 100
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.className,
                                                      for: indexPath) as! MyCell
        cell.backgroundColor = indexPath.section == 0 ? .red : .green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else  {
            return UICollectionReusableView()
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherHeader.className, for: indexPath) as! WeatherHeader
        return header
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 300) : .zero
        
    }
    
}

extension WeatherController: UICollectionViewDelegateFlowLayout {
   
}





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


