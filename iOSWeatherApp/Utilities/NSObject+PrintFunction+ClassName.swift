//
//  ReuseIdentifyable.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 27.10.2020.
//

import UIKit

extension NSObject {
    /// Prints function and caller's class name that call this function
    ///
    /// - Parameters:
    ///     - items:  Additional items to print
    func printFunction(_ function: String = #function, items: Any...) {
        print("Caller: \(Self.className) Function: \(function)", items)
   }
    
    /// Returns a name of an UIResponder
    static var className: String {
        return  NSStringFromClass(self.classForCoder())
            .components(separatedBy: ".").last ?? String(describing: self)
    }
    
}

