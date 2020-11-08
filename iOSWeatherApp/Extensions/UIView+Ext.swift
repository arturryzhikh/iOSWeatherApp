//
//  UIView+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 07.11.2020.
//

import UIKit
public extension UIView {
    func setSubviewForAutoLayout(_ subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(subview)
    }
    func setSubviewsForAutoLayout(_ subviews: UIView...) {
        subviews.forEach(self.setSubviewForAutoLayout)
    }
    func fill(_ view : UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


