//
//  UIView+Ext.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 07.11.2020.
//

import UIKit

public extension UIView {
    /// Adds individual UIView as subview, set it's translateAutoResizingMaskIntoConstraints property to false
    ///
    /// - Parameters:
    ///     - subview: UIView to add
    func setSubviewForAutoLayout(_ subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(subview)
    }
    /// Adds multiple UIViews as subviews, set their translateAutoResizingMaskIntoConstraints property to false
    ///
    /// - Parameters:
    ///     - subview: UIViews to add
    func setSubviewsForAutoLayout(_ subviews: [UIView]) {
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
    func horizontallyInContainer(_ view: UIView, isActive: Bool = true) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = isActive
    }
    func verticallyInContainer(_ view: UIView, isActive: Bool = true) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = isActive
    }
    func centerInContainer(_ view: UIView) {
        horizontallyInContainer(view)
        verticallyInContainer(view)
    }
    func trailingTo(_ view: UIView, constant: CGFloat = 0, isActive: Bool = true) {
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: constant).isActive = isActive
    }
    func leadingTo(_ view: UIView, constant: CGFloat = 0, isActive: Bool = true) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: constant).isActive = isActive
    }
    
}


