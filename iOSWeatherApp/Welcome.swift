//
//  OnecallResponse.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//

import Foundation


struct Welcome: Codable {
    
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let minutely: [Minutely]
    let hourly: [Current]?
    let daily: [Daily]?
    let alerts: [Alert]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset
        case current, minutely, hourly, daily, alerts
    }
}

// MARK: - Alert
struct Alert: Codable {
    let senderName, event: String?
    let start, end: Int?
    let alertDescription: String?

    enum CodingKeys: String, CodingKey {
        case senderName
        case event, start, end
        case alertDescription
    }
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
    let snow, rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike
        case pressure, humidity
        case dewPoint
        case uvi, clouds, visibility
        case windSpeed
        case windDeg
        case weather, pop, snow, rain
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: Main?
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription
        case icon
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case mist = "Mist"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Codable {
    case небольшойДождь = "небольшой дождь"
    case небольшойСнег = "небольшой снег"
    case пасмурно = "пасмурно"
    case снег = "снег"
    case снегСДождём = "снег с дождём"
    case туман = "туман"
    case ясно = "ясно"
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
    let pop, snow, uvi, rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike
        case pressure, humidity
        case dewPoint
        case windSpeed
        case windDeg
        case weather, clouds, pop, snow, uvi, rain
    }
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

// MARK: - Minutely
struct Minutely: Codable {
    let dt, precipitation: Int?
}

