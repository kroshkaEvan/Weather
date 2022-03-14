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
    var date: Int
    var temperature: Temperature
    var weather: [WeatherDetail]
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case weather = "weather"
    }

    init() {
        date = 0
        temperature = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "",
                                 description: "",
                                 icon: "")]
    }
}

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [WeatherDaily]

    static func empty() -> WeatherResponse {
        WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(),
                              count: 24),
            daily: [WeatherDaily](repeating: WeatherDaily(),
                                  count: 8)
        )
    }
}
