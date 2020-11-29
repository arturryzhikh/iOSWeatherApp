//
//  Screen.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 29.11.2020.
//

import UIKit

struct Screen {
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    static var width: CGFloat {
        return UIScreen.main.bounds.height
    }
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    static var scale: CGFloat {
        return UIScreen.main.scale
    }
}
