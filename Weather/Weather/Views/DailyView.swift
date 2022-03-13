//
//  DailyView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct DailyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel

    var body: some View {
        ForEach(weatherViewModel.weather.daily) { weather in
            LazyVStack {
                DailyWeatherCell(weather: weather)
            }
        }
    }

    private func DailyWeatherCell(weather: WeatherDaily) -> some View {
        HStack {
            VStack {
                Text(weatherViewModel.getDayFor(timestamp: weather.dt).uppercased())
                    .frame(width: 50)
                Spacer()
                Text(weatherViewModel.getDayNumber(timestamp: weather.dt))
                    .font(.title)
            }
            Spacer()
            weatherViewModel.getWeatherIconFor(icon: weather.weather[0].icon)
            VStack {
                Image(systemName: "arrow.down.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(weatherViewModel.getTempFor(temp: weather.temp.min))°C")
            }
            Spacer()
            VStack {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(weatherViewModel.getTempFor(temp: weather.temp.max))°C")
            }
        }
            .foregroundStyle(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 15)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
