//
//  UIView+AddSeparator.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 23.12.2020.
//

import UIKit

///enum that defines separator position in Clear Cell
enum SeparatorPosition {
    case top
    case bottom
}

extension UIView {
    func addSeparator(to position: SeparatorPosition, color: UIColor = .weatherWhite(), of height: CGFloat = 1 / Screen.scale, aboveSubview: UIView) {
        guard self.contains(aboveSubview)  else {
            printFunction(items: "aboveSubview \(aboveSubview.description) is not added into view heiarchy. Try to add it first")
            return
        }
       let separator = UIView()
        separator.backgroundColor = color
        separator.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(separator, aboveSubview: aboveSubview)
        separator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        separator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: height).isActive = true
        if position == .top {
            separator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        } else if position == .bottom {
            separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
    }
}
