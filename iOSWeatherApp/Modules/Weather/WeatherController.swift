//
//  ViewController.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.10.2020.
//

import UIKit
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
final class WeatherController: UIViewController {
    var headerHeightConstraint : NSLayoutConstraint!
    var headerMinHeight: CGFloat = 110
    lazy var headerMaxHeight: CGFloat = 300
    private var tableView: UITableView!
    private var header: WeatherHeader!
    private func makeGradient() {
        let layer = CAGradientLayer()
        layer.colors = [#colorLiteral(red: 1, green: 0.5058823824, blue: 0.4392151833, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)].map { $0.cgColor }
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupTableView()
       

    }
    
    private func setupTableView()  {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorColor = .red
        view.setSubviewForAutoLayout(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setupHeader() {
        header = WeatherHeader(frame: .zero)
        
        view.setSubviewForAutoLayout(header)
        headerHeightConstraint = header.heightAnchor.constraint(equalToConstant: 250)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerHeightConstraint
        ])
    }
    
}

extension WeatherController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .gray
        return cell
    }
    
    
    
}
extension WeatherController: UITableViewDelegate {
    
}
extension WeatherController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newHeaderHeight = headerHeightConstraint.constant - scrollView.contentOffset.y
        if newHeaderHeight >= headerMaxHeight {
            UIView.animate(withDuration: 0.15) {
                self.headerHeightConstraint.constant = self.headerMaxHeight
                self.view.layoutIfNeeded()
            }
            
           
        } else if  newHeaderHeight <= headerMinHeight {
            UIView.animate(withDuration: 0.15) {
                self.headerHeightConstraint.constant = self.headerMinHeight
                self.view.layoutIfNeeded()
            }
           
        } else {
            UIView.animate(withDuration: 0.15) {
                self.headerHeightConstraint.constant = newHeaderHeight
                self.view.layoutIfNeeded()
            }
           
        }
        self.view.layoutIfNeeded()
    }

//            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
//                //Scrolled to bottom
//                UIView.animate(withDuration: 0.3) {
//                    self.headerHeightConstraint.constant = 0.0
//                    self.view.layoutIfNeeded()
//                }
//            }
//            else if (scrollView.contentOffset.y < self.lastContentOffset || scrollView.contentOffset.y <= 0) && (self.headerHeightConstraint.constant != self.maxHeaderHeight)  {
//                //Scrolling up, scrolled to top
//                UIView.animate(withDuration: 0.3) {
//                    self.headerHeightConstraint.constant = self.maxHeaderHeight
//                    self.view.layoutIfNeeded()
//                }
//            }
//            else if (scrollView.contentOffset.y > self.lastContentOffset) && self.headerHeightConstraint.constant != 0.0 {
//                //Scrolling down
//                UIView.animate(withDuration: 0.3) {
//                    self.headerHeightConstraint.constant = 0.0
//                    self.view.layoutIfNeeded()
//                }
//            }
//            self.lastContentOffset = scrollView.contentOffset.y


}
