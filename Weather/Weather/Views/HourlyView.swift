//
//  HourlyView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct HourlyView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        // Text("Hourly Forecast")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(weatherViewModel.weather.hourly) { weather in
                    let icon = weatherViewModel.getWeatherIconFor(icon: (weather.weather.count > 0) ? weather.weather[0].icon : "sun.max.fill")
                    let hour = weatherViewModel.getTimeFor(timestamp: weather.dt)
                    let temp = weatherViewModel.getTempFor(temp: weather.temp)
                    
                    HourlyWeatherCell(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func HourlyWeatherCell(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
                .font(.title)
            image
                .foregroundStyle(.white)
            
            Text("\(temp)°C")
        }
        .foregroundStyle(.white)
        .padding()
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView(weatherViewModel: WeatherViewModel())
    }
}
