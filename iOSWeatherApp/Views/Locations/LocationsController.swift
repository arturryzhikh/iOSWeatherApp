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
    fileprivate lazy var pages: [WeatherController] = {
        return [
            self.getViewController(),
            self.getViewController(),
            
        ]
    }()
    fileprivate func getViewController() -> WeatherController {
        return WeatherController()
    }
    //MARK: Subviews
    //background
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        //FIXME: Hardcoded image name
        iv.image = UIImage(named: "background")
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = pages.count
        pc.currentPage = 0
        pc.tintColor = UIColor.black
        pc.pageIndicatorTintColor = .weatherTransparent
        pc.currentPageIndicatorTintColor = .weatherWhite
        return pc
    }()
    //MARK: Life cycle
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            pageControl.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -Screen.height * 0.08),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate   = self
        view.addSubviewForAutoLayout(pageControl)
        view.insertSubview(backgroundImageView, at: 0)
        setupConstraints()
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
    }
}
extension LocationsController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.firstIndex(of: viewController as! WeatherController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0  else { return nil }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.firstIndex(of: viewController as! WeatherController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = pages.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return pages[nextIndex]
        
    }
}

extension LocationsController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pages.firstIndex(of: pageContentViewController as! WeatherController)!
    }
    
    
    
}
