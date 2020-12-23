//
//  LocationsViewController.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit
import UIKit

final class LocationsController: UIPageViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var weatherControllers: [WeatherController] = {
        return [
            self.getViewController(),
            self.getViewController(),
            self.getViewController(),
            self.getViewController(),
            self.getViewController(),
            self.getViewController()
        ]
    }()
    private func getViewController() -> WeatherController {
        return WeatherController()
    }
    //MARK: Subviews
   //Page control
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = weatherControllers.count
        pc.tintColor = UIColor.black
        pc.currentPage = 0
        pc.addTarget(self, action: #selector(self.pageControlDotDidPressed(_:)), for: .touchUpInside)
        return pc
    }()
    //MARK: Life cycle
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Screen.height * 0.03),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate   = self
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        view.addSubviewForAutoLayout(pageControl)
        setupConstraints()
        if let firstVC = weatherControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
        }
    }
    //MARK: Instance methods
    @objc private func pageControlDotDidPressed(_ sender: UIPageControl) {
        let index = sender.currentPage
        let vc = weatherControllers[index]
        setViewControllers([vc], direction: .forward, animated: true, completion: nil)
       
        }
}
extension LocationsController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = weatherControllers.firstIndex(of: viewController as! WeatherController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0  else { return nil }
        
        guard weatherControllers.count > previousIndex else { return nil        }
        
        return weatherControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = weatherControllers.firstIndex(of: viewController as! WeatherController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = weatherControllers.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return weatherControllers[nextIndex]
        
    }
}

extension LocationsController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = weatherControllers.firstIndex(of: pageContentViewController as! WeatherController)!
    }
    
    
    
}
