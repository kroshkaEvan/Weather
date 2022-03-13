//
//  WeatherResponse.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import Foundation

struct Temperature: Codable {
    var min: Double
    var max: Double
}

struct WeatherDaily: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]

    enum CodingKey: String {
        case dt
        case temp
        case weather
    }

    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension WeatherDaily {
    var id: UUID {
        UUID()
    }
}

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [WeatherDaily]

    static func empty() -> WeatherResponse {
        WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(), count: 24),
            daily: [WeatherDaily](repeating: WeatherDaily(), count: 8)
        )
    }
}
