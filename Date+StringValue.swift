//
//  Date+StringValue.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 28.12.2020.
//

import Foundation

extension Date {
    func stringFromDate(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
