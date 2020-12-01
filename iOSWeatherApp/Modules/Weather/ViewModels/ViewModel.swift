//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//

import UIKit

class ViewModel {
    func numberOfItemsIn(section: Int) -> Int  {
        switch section {
        case 0:
        return 0
        case 1:
        return 9
        case 2:
        return 1
        case 3:
        return 10
        case 4:
        return 1
        default:
        fatalError("Wrong number of items in section")
        }
    }
    var numbersOfSections: Int {
        return 5
    }
}
