//
//  Weather.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import Foundation

struct WeatherDetail: Codable, Identifiable {
    var main: String
    var description: String
    var icon: String
    var id: Int {
        0
    }
}

struct Weather: Codable, Identifiable {
    var date: Int
    var temperature: Double
    var feelsLike: Double
    var pressure: Int
    var humidity: Int
    var dewPoint: Double
    var clouds: Int
    var windSpeed: Double
    var windDeg: Int
    var weather: [WeatherDetail]
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case clouds = "clouds"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather = "weather"
    }

    init() {
        date = 0
        temperature = 0.0
        feelsLike = 0.0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        clouds = 0
        windSpeed = 0.0
        windDeg = 0
        weather = []
    }
}

