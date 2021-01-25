//
//  Fetcher.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//
import Foundation

protocol APIRequest: Encodable {
    
    associatedtype Response: Decodable
    
    var endPoint: String { get }
    
    var queries: [String:String] { get set }
    
}
