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
            HStack {
                Text(weatherViewModel.getDayFor(weather.dt).uppercased())
                    .frame(width: 50)
                Text(weatherViewModel.getDayNumber(weather.dt))
            }
            Spacer()
            weatherViewModel.getWeatherIconFor(icon: weather.weather[0].icon)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Dimensions.defaultWidth,
                       height: Constants.Dimensions.defaultHeight,
                       alignment: .center)
            Spacer()
            HStack {
                Image("cold")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(weatherViewModel.getTempFor(weather.temp.min))°C")
            }
            Spacer()
            HStack {
                Image("warm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(weatherViewModel.getTempFor(weather.temp.max))°C")
            }
        }
        .font(.system(size: Constants.Font.smallSize))
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
