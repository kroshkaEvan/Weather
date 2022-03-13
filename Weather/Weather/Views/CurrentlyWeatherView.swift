//
//  CurrentlyWeatherView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct CurrentlyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: Constants.Dimensions.firstSpacing) {
            weatherViewModel.getWeatherIconFor(icon: weatherViewModel.weatherIcon)
                .resizable()
                .scaledToFill()
                .frame(width: (CGFloat(3)*(Constants.Dimensions.defaultWidth)),
                       height: (CGFloat(3)*(Constants.Dimensions.defaultHeight)),
                       alignment: .center)
            HStack(spacing: Constants.Dimensions.secondSpacing) {
                VStack(alignment: .center) {
                    Text("\(weatherViewModel.temperature)°C")
                        .font(.system(size: Constants.Font.largeSize))
                    Text(weatherViewModel.conditions)
                        .font(.system(size: Constants.Font.mediumSize))
                }
            }
            HStack {
                Spacer()
                WidgetView(image: Constants.Images.wind,
                           text: Constants.Strings.windSpeed,
                           title: "\(weatherViewModel.windSpeed) m/s")
                Spacer()
                WidgetView(image: Constants.Images.humidity,
                           text: Constants.Strings.humidity,
                           title: "\(weatherViewModel.humidity)")
                Spacer()
                WidgetView(image: Constants.Images.umbrella,
                           text: Constants.Strings.rainChances,
                           title: "\(weatherViewModel.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: Constants.Colors.gradient),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
        )
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    private func WidgetView (image: String,
                             text: String,
                             title: String) -> some View {
        VStack {
            Text(text)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Dimensions.defaultWidth,
                       height: Constants.Dimensions.defaultHeight,
                       alignment: .center)
            Text(title)
        }
        .font(.system(size: Constants.Font.smallSize))
    }
}

struct CurrentlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
