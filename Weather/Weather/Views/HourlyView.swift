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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Constants.Dimensions.secondSpacing) {
                ForEach(weatherViewModel.weather.hourly) { weather in
                    let icon = weatherViewModel.getWeatherIconFor(icon: (weather.weather.count > 0) ? weather.weather[0].icon : "sun")
                    let hour = weatherViewModel.getTimeFor(weather.dt)
                    let temp = weatherViewModel.getTempFor(weather.temp)
                    
                    HourlyWeatherCell(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func HourlyWeatherCell(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: Constants.Dimensions.secondSpacing) {
            Text(hour)
            image
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Dimensions.defaultWidth,
                       height: Constants.Dimensions.defaultHeight,
                       alignment: .center)
            Text("\(temp)°C")
        }
        .font(.system(size: Constants.Font.smallSize))
        .foregroundStyle(.white)
        .padding()
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView(weatherViewModel: WeatherViewModel())
    }
}
