//
//  OnecallResponse.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//

import Foundation
//

struct WeatherResponse: Decodable {
    
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?

}

// MARK: - Current
struct Current: Decodable {
    
    let dt, sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let snow: Snow?
    let pop: Double?

}

// MARK: - Snow
struct Snow: Codable {
    
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int?
    let main: Main?
    let weatherDescription: Description?

}

enum Main: String, Decodable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Decodable {

    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case lightRain = "light rain"
    case lightSnow = "light snow"
    case overcastClouds = "overcast clouds"
    case snow = "snow"
}

// MARK: - Daily
struct Daily: Decodable {
    
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let clouds: Int?
    let pop, snow, uvi, rain: Double?

}

// MARK: - FeelsLike
struct FeelsLike: Decodable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Decodable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}
