//
//  OnecallResponse.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//
import Foundation

import Foundation


struct WeatherResponse: Codable {
    
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?

}

// MARK: - Current
struct Current: Codable {
    let dt, sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let pop: Double?


}


// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: Main?
  
}

enum Main: String, Codable {
    case clouds = "Clouds"
    case mist = "Mist"
    case snow = "Snow"
    case rain = "Rain"
    case clear = "Clear"
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let clouds: Int?
    let pop, snow, uvi: Double?

}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}
