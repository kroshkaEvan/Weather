//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI
import CoreLocation

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var isLoading = false
    @Published var city = Constants.Strings.city {
        didSet {
            getLocation()
        }
    }

    init() {
        getLocation()
    }

    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }

    private func getWeather(coord: CLLocationCoordinate2D?) {
        var urlString = ""
        if let coord = coord {
            urlString = WeatherApi.getCurrentWeatherURL(lat: coord.latitude, lon: coord.longitude)
        } else {
            urlString = WeatherApi.getCurrentWeatherURL(lat: 53.9, lon: 27.5667)
        }
        getWeatherInternal(city: city, for: urlString)
    }

    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }

    // MARK: fields
    var date: String {
        Time.defaultDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)) )
    }

    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "dayClearSky"
    }

    var temperature: String {
        getTempFor(temp: weather.current.temp)
    }

    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }

    var windSpeed: String {
        String(format: "%0.1f", weather.current.wind_speed)
    }

    var humidity: String {
        String(format: "%d%%", weather.current.humidity)
    }

    var rainChances: String {
        String(format: "%0.1f%%", weather.current.dew_point)
    }

    func getTimeFor(timestamp: Int) -> String {
        Time.timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }

    func getDayFor(timestamp: Int) -> String {
        Time.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDayNumber(timestamp: Int) -> String {
        Time.dayNumberFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }

    func getTempFor(temp: Double) -> String {
        String(format: "%0.1f", temp)
    }

    // MARK: icons
    func getLottieAnimationFor(icon: String) -> String {
        switch icon {
            case "01d":
                return "dayClearSky"
            case "01n":
                return "nightClearSky"
            case "02d":
                return "dayFewClouds"
            case "02n":
                return "nightFewClouds"
            case "03d":
                return "dayScatteredClouds"
            case "03n":
                return "nightScatteredClouds"
            case "04d":
                return "dayBrokenClouds"
            case "04n":
                return "nightBrokenClouds"
            case "09d":
                return "dayShowerRains"
            case "09n":
                return "nightShowerRains"
            case "10d":
                return "dayRain"
            case "10n":
                return "nightRain"
            case "11d":
                return "dayThunderstorm"
            case "11n":
                return "nightThunderstorm"
            case "13d":
                return "daySnow"
            case "13n":
                return "nightSnow"
            case "50d":
                return "dayClearSky"
            case "50n":
                return "dayClearSky"
            default:
                return "dayClearSky"
        }
    }

    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
            case "01d":
                return Image(systemName: "sun.max.fill")     // Clear sky day
            case "01n":
                return Image(systemName: "moon.fill")        // Clear sky night
            case "02d":
                return Image(systemName: "cloud.sun.fill")
            case "02n":
                return Image(systemName: "cloud.moon.fill")
            case "03d":
                return Image(systemName: "cloud.fill")
            case "03n":
                return Image(systemName: "cloud.fill")
            case "04d":
                return Image(systemName: "cloud.fill")
            case "04n":
                return Image(systemName: "cloud.fill")
            case "09d":
                return Image(systemName: "cloud.drizzle.fill")
            case "09n":
                return Image(systemName: "cloud.drizzle.fill")
            case "10d":
                return Image(systemName: "cloud.heavyrain.fill")
            case "10n":
                return Image(systemName: "cloud.heavyrain.fill")
            case "11d":
                return Image(systemName: "cloud.bolt.fill")
            case "11n":
                return Image(systemName: "cloud.bolt.fill")
            case "13d":
                return Image(systemName: "cloud.snow.fill")
            case "13n":
                return Image(systemName: "cloud.snow.fill")
            case "50d":
                return Image(systemName: "cloud.fog.fill")
            case "50n":
                return Image(systemName: "cloud.fog.fill")
            default:
                return Image(systemName: "sun.max.fill")
        }
    }
}
