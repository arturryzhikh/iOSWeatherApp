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
    var headerMinHeight: CGFloat = 104
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
        view.backgroundColor = .blue

    }
    
    private func setupTableView()  {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.backgroundColor = .red
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.backgroundColor = .black
            return cell
        case 2:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .yellow
        return cell
        default:
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
            cell.backgroundColor = .green
        return cell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        view.backgroundColor = .magenta
            return view }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 150: 0
        
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
                scrollView.contentOffset.y = 0
                self.view.layoutIfNeeded()
            }
           
        }
        self.view.layoutIfNeeded()
    }
}
