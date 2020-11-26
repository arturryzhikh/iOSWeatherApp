//
//  ReuseIdentifyable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 26.11.2020.
//
import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return NSStringFromClass(Self.self)
    }
   
}
